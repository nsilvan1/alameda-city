function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end
	
Citizen.CreateThread(function()
	AddTextEntry('MERCXCLASS', 'Mercedes X-Class - (2018)') --mercxclass
end)