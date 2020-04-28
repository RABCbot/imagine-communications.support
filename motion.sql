--record count per endpoint alias
LEFT JOIN hx_mediabase.Metadata as m
ON f.Id = m.FileId
LEFT JOIN hx_mediabase.Directories as d
ON f.DirectoryId = d.Id
LEFT JOIN hx_resource.PublishedEndpoint as e
ON d.EndpointId = e._id
WHERE e.Alias Like 'Nexio-MBS%'
AND f.IsDeleted = 0
GROUP BY e.Alias
