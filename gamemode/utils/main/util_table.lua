function table.index(value, list)
    local index={}
    for k,v in pairs(list) do
       index[v]=k
    end
    return index[value]
end