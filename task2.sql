--настроить пользователя администратора
CREATE USER mosienko_j_admin IDENTIFIED WITH sha256_password BY 'qwerty_432';
GRANT CURRENT GRANTS ON *.* TO mosienko_j_admin WITH GRANT OPTION;
