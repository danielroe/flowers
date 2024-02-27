CREATE MIGRATION m1hbzmhgl2gbhok7cu23ftmx37em5mfjhkw3mfjfehkvcor6autuzq
    ONTO m1u3u6kej6vt3fsi7etxtxpxqn4jcvvmcypb3iaztsff6tikqoa2cq
{
  ALTER TYPE default::Comment {
      DROP ACCESS POLICY admin_has_full_access;
  };
  ALTER TYPE default::User {
      ALTER PROPERTY userRole {
          RENAME TO email;
      };
  };
  ALTER TYPE default::User {
      ALTER PROPERTY email {
          RESET default;
      };
  };
};
