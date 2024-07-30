
-- test for adding car to database with owner
RegisterCommand('mi_addcar', function()

end, false)


-- test for removing car to database with owner
RegisterCommand('mi_remcar', function()
    
end, false)


-- test for loading car to database with owner
RegisterCommand('mi_loadcar', function()
    
end, false)




-- testing for images
-- tp coords -213.182, -1328.416, 31.300, 74.622
RegisterCommand('testcar', function()
    local vehicle = lib.callback.await('mivehicle:test', false, source)
end, false)