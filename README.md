# WB_Practice-Clickhouse

1) Поднять кликхаус в докере
   docker run -d --name some-clickhouse-server -p 8123:8123 --ulimit nofile=262144:262144 clickhouse/clickhouse-server
   
   ![telegram-cloud-photo-size-2-5220193347543623133-x](https://github.com/julimosienko/WB_Practice-Clickhouse/assets/152617308/58206ec5-fe7a-4e36-b189-bb0d076800f9)
   
2) Настроить пользователя администратора
   [task2](https://github.com/julimosienko/WB_Practice-Clickhouse/blob/main/task2.sql)

3) Создать базы для стейджинга, исторических данных, текущих данных и буферных таблиц
   [task3](https://github.com/julimosienko/WB_Practice-Clickhouse/blob/main/task3.sql)
   ![telegram-cloud-photo-size-2-5220193347543623147-x](https://github.com/julimosienko/WB_Practice-Clickhouse/assets/152617308/80157c80-9ffe-4e8e-9dc6-f44f73f90556)

4) Создать роль только для чтения и роль с возможность создавать и заполнять данные в БД стейджинга(stg). Создать двух пользователей с такими правами по умолчанию.
   [task4](https://github.com/julimosienko/WB_Practice-Clickhouse/blob/main/task4.sql)
   ![telegram-cloud-photo-size-2-5220193347543623148-y](https://github.com/julimosienko/WB_Practice-Clickhouse/assets/152617308/92e857b4-5f75-4459-8d46-588d31b8f118)

5) Реализовать через буфферную таблицу заполнение stg слоя
   [task5](https://github.com/julimosienko/WB_Practice-Clickhouse/blob/main/task5.sql)

6) Создать матереализованное представление для перемещения данных из stg слоя в слой текущих данных
   [task6](https://github.com/julimosienko/WB_Practice-Clickhouse/blob/main/task6.sql)

7) Смоделировать вставку данных в буфферную таблицу для stg слоя. В конечном итоге данные должны быть заполнены и в stg слое, и в слое текущих данных.
Команды для выполнениния пунктов 2-7 включительно, выложить в свой git. Каждый пункт - отдельный файл
Для пункта 7 необходимы скриншоты данных в таблице stg и current слоя

![telegram-cloud-photo-size-2-5220193347543623157-y](https://github.com/julimosienko/WB_Practice-Clickhouse/assets/152617308/2efbe688-6c8b-4126-906a-f90d7273c3ae)

![telegram-cloud-photo-size-2-5220193347543623158-y](https://github.com/julimosienko/WB_Practice-Clickhouse/assets/152617308/2b9228fa-d454-4d40-a41d-fe6433a97cba)

![telegram-cloud-photo-size-2-5220193347543623159-y](https://github.com/julimosienko/WB_Practice-Clickhouse/assets/152617308/ef936978-8d34-4c6e-ab12-27db786af064)




   
