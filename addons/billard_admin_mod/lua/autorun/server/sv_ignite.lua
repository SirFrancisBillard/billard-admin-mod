-- Light players on fire

local function findplayer( name )
	name = string.lower( name )
	for k,v in pairs( player.GetAll() ) do
		if string.lower(v:SteamID() ) == name then
			return v
		end
		if string.lower( v:UniqueID() ) == name then
			return v
		end
		local nick = string.lower( v:Nick()  )
		if string.find( nick, name ) then
			return v
		end
		if v.SteamName then
			local sname = string.lower( v:SteamName() )
			if string.find( sname, name ) then
				return v
			end
		end
	end
end

concommand.Add( "billard_ignite", function( ply, cmd, args )
	if not args[1] then return end
	if not IsValid( ply ) then return end
	if not ply:IsAdmin() then
		ply:ChatPrint( "You do not have permission to use this command!" )
		return
	end
	local BurnTime = 12
	if not args[2] then
		Burntime = 12
	else
		BurnTime = tonumber( args[2] )
	end
	if findplayer( tostring( args[1] ) ) then
		local Baddie = findplayer( tostring( args[1] ) )
		Baddie:Ignite( BurnTime )
	else
		ply:ChatPrint( "Player not found!" )
	end
end )
