CREATE MIGRATION m1g373l4wpzyrvnkngu7fgptkvvc6u47iu2s4ruh7vuqlojgsatstq
    ONTO m1t4rrag55bkwomdbstxokkktpascglc54v77neb3v6topfj5rguca
{
  ALTER TYPE default::User {
      ALTER PROPERTY userRole {
          SET TYPE std::str USING ('attendee');
      };
  };
  ALTER GLOBAL default::current_user USING (std::assert_single((SELECT
      default::User {
          id,
          name,
          userRole
      }
  FILTER
      (.identity = GLOBAL ext::auth::ClientTokenIdentity)
  )));
  ALTER TYPE default::Comment {
      CREATE ACCESS POLICY admin_has_full_access
          ALLOW ALL USING (((.author ?= GLOBAL default::current_user) AND ((GLOBAL default::current_user).userRole ?= 'admin')));
  };
  ALTER TYPE default::User {
      DROP PROPERTY email;
  };
  DROP SCALAR TYPE default::Role;
};
