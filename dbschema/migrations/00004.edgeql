CREATE MIGRATION m165mug6ql6ont2w4fh7bto7dwhvb3djfinwda6b34jzp4m52kgdgq
    ONTO m1g373l4wpzyrvnkngu7fgptkvvc6u47iu2s4ruh7vuqlojgsatstq
{
  ALTER TYPE default::Comment {
      ALTER ACCESS POLICY admin_has_full_access USING (((GLOBAL default::current_user).userRole ?= 'admin'));
  };
};
