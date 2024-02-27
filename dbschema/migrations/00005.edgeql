CREATE MIGRATION m1u3u6kej6vt3fsi7etxtxpxqn4jcvvmcypb3iaztsff6tikqoa2cq
    ONTO m165mug6ql6ont2w4fh7bto7dwhvb3djfinwda6b34jzp4m52kgdgq
{
  ALTER TYPE default::User {
      CREATE PROPERTY created: std::datetime {
          CREATE REWRITE
              INSERT 
              USING (std::datetime_of_statement());
      };
      CREATE PROPERTY updated: std::datetime {
          CREATE REWRITE
              INSERT 
              USING (std::datetime_of_statement());
          CREATE REWRITE
              UPDATE 
              USING (std::datetime_of_statement());
      };
  };
};
