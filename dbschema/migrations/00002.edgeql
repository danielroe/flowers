CREATE MIGRATION m1t4rrag55bkwomdbstxokkktpascglc54v77neb3v6topfj5rguca
    ONTO m1hhv3kqr5bu2h353c7chh7xvjbnqk35odn4e4up2sx4aezswk3pxq
{
  ALTER GLOBAL default::current_user USING (std::assert_single((SELECT
      default::User {
          id,
          name
      }
  FILTER
      (.identity = GLOBAL ext::auth::ClientTokenIdentity)
  )));
  ALTER TYPE default::Comment {
      ALTER LINK author {
          SET default := (GLOBAL default::current_user);
      };
      CREATE ACCESS POLICY author_has_full_access
          ALLOW ALL USING ((.author ?= GLOBAL default::current_user));
      CREATE ACCESS POLICY others_read_only
          ALLOW SELECT ;
      CREATE PROPERTY public: std::bool {
          SET default := false;
      };
  };
};
