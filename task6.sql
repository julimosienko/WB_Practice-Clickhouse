--cоздать матереализованное представление для перемещения данных из stg слоя в слой текущих данных
create table if not exists current.tareLoad
(
    tare_id       UInt64,
    is_load       UInt8,
    dt            DateTime,
    office_id     UInt32,
    dst_office_id UInt32 comment 'load>0, unload=0'
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
    office_id     UInt32,
    dst_office_id UInt32 comment 'load>0, unload=0'
)
AS
SELECT tare_id
    , is_load
    , dt
    , office_id
    , dst_office_id
FROM stg.tareLoad;
