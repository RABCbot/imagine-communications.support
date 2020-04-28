--select files from an endpoint
select f.Name, f.CreatedOn, f.IsClosed from hx_mediabase.Files as f
join hx_mediabase.Metadata as m on f.Id = m.FileId
join hx_mediabase.Directories as d on f.DirectoryId = d.Id
join hx_resource.PublishedEndpoint as e on d.EndpointId = e._id
where e.Alias = 'Nexio-MBS-LI'
and f.IsDeleted = 0

-- action in endpoint
select Alias, JobId, Created, [State], Message 
from hx_resource.Action as a
left outer join hx_resource.PublishedEndpoint as pe on a.SourceEndpointId = pe._id
order by Created 

-- spy running 
select Alias, JobId, Created, State, Message, ActionType 
FROM hx_resource.Action as a 
left outer join hx_resource.PublishedEndpoint as pe on a.SourceEndpointId = pe._id
where a.State = 'Running' and a.ActionType = 'spy'
order by Created 

-- file name with endpoint alias
select f.id, f.Name, pe.Alias as EndpointAlias
from hx_mediabase.Files as f
left outer join hx_mediabase.Directories as d on d.Id = f.DirectoryId
left outer join hx_resource.PublishedEndpoint as pe on pe._id = d.EndpointId
order by pe.Alias

-- total files by name
select f.Name, total = Count(*)
from hx_mediabase.Files as f
left outer join hx_mediabase.Directories as d on d.Id = f.DirectoryId
left outer join hx_resource.PublishedEndpoint as pe on pe._id = d.EndpointId
group by f.Name 
order by total desc

-- metadata
select f.id, f.Name, pe.Alias, m.Metadata 
from hx_mediabase.Files as f
left outer join hx_mediabase.Metadata as m on f.Id = m.FileId
left outer join hx_mediabase.Directories as d on f.DirectoryId = d.Id
left outer join hx_resource.PublishedEndpoint as pe on pe._id = d.EndpointId
where f.Name = XXXXX

-- heavy use
select 
D.Name as "device Name",
E.Alias as "Endpoint name",
ISNULL(E.HeavyConnectionLimit,10) as "Endpoint Heavy Limit",
ISNULL(D.HeavyConnectionLimit,10) as "Device Heavy Limit",
V.Heavy as "HEAVY IN USE"
from hx_resource.V_EndpointConnectionsInUse V
Inner join hx_resource.PublishedEndpoint E on E._id = V.EndpointId
Inner join hx_resource.PublishedDevice D on D.Id = E.DeviceId
order by d.Id, E._id

-- running jobs
select pe.Alias,jat.Name,pendingJobCount=count(*)
  FROM hx_resource.Job j
  left join hx_resource.JobActionTypes jat on jat.Id = j._actionType
  left join hx_resource.JobStates js on js.Id = j._state
  left join hx_resource.PublishedEndpoint pe on pe._id = SourceAddressId
  where _state <= 2
  group by pe.Alias, jat.Name
  order by pendingJobCount desc

-- running setExtendedInfoitem jobs
select top 1000 pe.Alias, jat.Name, w.Name wfName
from  hx_resource.job j
left join hx_resource.JobActionTypes jat on jat.Id = j._actionType
left join hx_resource.JobStates js on js.Id = j._state
left join hx_resource.PublishedEndpoint pe on pe._id = SourceAddressId
left join hx_workflow.WorkflowInstanceInfo wi on wi.WF4Id = j.WF4InstanceId
left join hx_workflow.WorkflowInfo w on w.LastVersionInfoId = wi.VersionInfoId
where _state <= 2 and jat.name ='setExtendedInfoitem' and j.WF4InstanceId is not null

-- get truncate metadata
select e.Alias, f.Name, m.Metadata from hx_mediabase.Files as f
join hx_mediabase.Metadata as m on f.Id = m.FileId
join hx_mediabase.Directories as d on d.Id = f.DirectoryId
join hx_resource.PublishedEndpoint as e on d.EndpointId = e._id
where Right(m.Metadata, 1) <> '}'
And e.Alias Not like 'Proxy%'

-- sub workflow relation
select 
sw.WorkflowInfoId,
(select hx_workflow.WorkflowInfo.Name from hx_workflow.WorkflowInfo where hx_workflow.WorkflowInfo._id = sw.WorkflowInfoId) as wfName, 
sw.VersionInfoId,
(select hx_workflow.WorkflowInfo.Name
from hx_workflow.VersionInfo 
left outer join hx_workflow.WorkflowInfo on hx_workflow.WorkflowInfo.PublishedVersionInfoId = hx_workflow.VersionInfo._id 
where hx_workflow.VersionInfo._id = sw.VersionInfoId) as subName
from hx_workflow.WorkflowSubWorkflowRelation as sw



