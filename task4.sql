--cоздать роль только для чтения и роль с возможность создавать и заполнять данные в БД стейджинга(stg). Создать двух пользователей с такими правами по умолчанию.
create  role read_only;
grant select on *.* TO read_only;

create user mosienko_reader identified with sha256_password by 'reader_432' ;
grant read_only to mosienko_reader;

create role stage_role;
grant create, insert ON stage.* TO stage_role;

create user mosienko_stager identified with sha256_password by 'stager_432' ;
grant stage_role to mosienko_stager;
