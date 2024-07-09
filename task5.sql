--реализовать через буфферную таблицу заполнение stg слоя
create table if not exists stg.tareLoad
(
    tare_id       UInt64,
    is_load       UInt8,
    dt            DateTime,
    tare_sticker  String,
    tare_type     LowCardinality(String),
    office_id     UInt32,
    dst_office_id UInt32 comment 'load>0, unload=0',
    wh_tare_entry String,
    dt_reported   DateTime,
    task_id       LowCardinality(String),
    licence_plate LowCardinality(String),
    dt_load       DateTime materialized now()
)
    engine = MergeTree()
    PARTITION BY toYYYYMMDD(dt_load)
    ORDER BY (is_load, tare_id)
    TTL toStartOfDay(dt_load) + toIntervalDay(3)
    SETTINGS ttl_only_drop_parts = 1, index_granularity = 8192, merge_with_ttl_timeout = 36000;

create table if not exists direct_log.tareLoad
(
    tare_id       UInt64,
    is_load       UInt8,
    dt            DateTime,
    tare_sticker  String,
    tare_type     LowCardinality(String),
    office_id     UInt32,
    dst_office_id UInt32 comment 'load>0, unload=0',
    wh_tare_entry String,
    dt_reported   DateTime,
    task_id       LowCardinality(String),
    licence_plate LowCardinality(String),
    dt_load       DateTime materialized now()
)
    engine = Buffer('stg', 'tareLoad', 16, 10, 100, 10000, 1000000, 10000000, 100000000);
