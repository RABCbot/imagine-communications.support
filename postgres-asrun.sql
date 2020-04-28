-- query an asrun channel guid by date
select data->'Start'->'Date' as StartDate,
data->'Start'->'Timecode' as StartTime,
data->'PrimaryContent'->'HouseId' as houseId,
data->'PrimaryContent'->'SegmentNumber' as Seg,
data->'PrimaryContent'->'Title' as Title,
data->'PrimaryContent'->'Filename' as Filename,
data->'PrimaryContent'->'SOM' as SOM,
data->'PrimaryContent'->'Duration' as Duration,
data->'AsRunStatus' as Status,
data->'StartMode' as StartMode,
data->'ReconcileKey' as Reconcile
from public."<asrun-guid>" 
where data->'Start' @> '{"Date":"2020-01-01T00:00:00"}'
