util.AddNetworkString( "f4menu" )

hook.Add( "ShowSpare2", "F4MenuHook", function( ply )
    net.Start( "f4menu" )
    net.Send( ply )
end )