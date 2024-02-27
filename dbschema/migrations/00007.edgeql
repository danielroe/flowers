CREATE MIGRATION m1s76j546nqm3mmnq5emri3rs7p5pa5sd7kcarz77hzcy5g3awguja
    ONTO m1hbzmhgl2gbhok7cu23ftmx37em5mfjhkw3mfjfehkvcor6autuzq
{
  CREATE SCALAR TYPE default::Role EXTENDING enum<admin, attendee>;
  ALTER TYPE default::User {
      CREATE PROPERTY userRole: default::Role {
          SET default := 'attendee';
      };
  };
  ALTER GLOBAL default::current_user USING (std::assert_single((SELECT
      default::User {
          id,
          name,
          email,
          userRole
      }
  FILTER
      (.identity = GLOBAL ext::auth::ClientTokenIdentity)
  )));
  ALTER TYPE default::Comment {
      CREATE ACCESS POLICY admin_has_full_access
          ALLOW ALL USING (((GLOBAL default::current_user).userRole ?= default::Role.admin));
  };
};
