using extension auth;

module default {
  scalar type Role extending enum<admin, attendee>;

  global current_user := (
    assert_single((
      select User { id, name }
      filter .identity = global ext::auth::ClientTokenIdentity
    ))
  );

  type Comment {
    required text: str;
    required author: User {
      default := global current_user;
    };
    public: bool {
      default := false;
    }
    created: datetime {
      rewrite insert using (datetime_of_statement());
    }
    updated: datetime {
      rewrite insert using (datetime_of_statement());
      rewrite update using (datetime_of_statement());
    }

    access policy author_has_full_access
      allow all
      using (.author ?= global current_user);
    access policy others_read_only
      allow select;
  }

  type User {
    required identity: ext::auth::Identity;
    name: str;
    email := .identity.email;
    userRole: Role {
      default := "attendee";
    };
    multi comments := .<author[is Comment]
  }
}
