--cоздать матереализованное представление для перемещения данных из stg слоя в слой текущих данных
create table if not exists current.tareLoad
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
    engine = ReplacingMergeTree()
    ORDER BY (is_load, tare_id)
    SETTINGS index_granularity = 8192;

CREATE MATERIALIZED VIEW default.mv_tareLoad
TO current.tareLoad
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
AS
SELECT tare_id
    , is_load
    , dt
    , tare_sticker
    , tare_type
    , office_id
    , dst_office_id
    , wh_tare_entry
    , dt_reported
    , task_id
    , licence_plate
FROM stg.tareLoad;
