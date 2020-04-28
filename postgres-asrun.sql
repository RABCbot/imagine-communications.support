### query an asrun channel by guid by date
select data->'Start'->'Timecode', data->'PrimaryContent'->'HouseId', data->'SegmentNumber', 
data->'Title', data->'Duration', data->'AsRunStatus', data->'ReconcileKey' 
from public."<asrun-guid>" 
where data->'Start' @> '{"Date":"2020-01-01T00:00:00"}'
