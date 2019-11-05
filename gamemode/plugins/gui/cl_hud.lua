local function DrawDamagedDisplay()
	if( LocalPlayer():Health() <= 50 ) then
		if( LocalPlayer():Health() <= 40 ) then
			local blurmul = 0;
			local cutoff = 50;
			if( LocalPlayer():Health() <= 30 ) then
				cutoff = 120;
			end
			if( LocalPlayer():Health() <= 20 ) then
				cutoff = 200;
			end	
			blurmul = 1 - math.Clamp( LocalPlayer():Health() / cutoff, 0, 1 );
			-- .149
			-- .955
			-- .068
			DrawMotionBlur( .149 * blurmul, .955 * blurmul, .068 * blurmul );
		end
		surface.SetDrawColor( 135, 0, 0, 160 * ( 1 - math.Clamp( LocalPlayer():Health() / 50, 0, 1 ) ) );
		surface.DrawRect( 0, 0, ScrW(), ScrH() );
	end
end

function GM:HUDPaint()
	if (rp.Config.HUD.Effects) then
	    DrawDamagedDisplay()
	end
end

function GM:HUDShouldDraw( name )
	local nodraw = 
	{
		"CHudHealth",
		"CHudAmmo",
		"CHudSecondaryAmmo",
		"CHudBattery",
		"CHudWeaponSelection",
		"CHudCrosshair"
	}
	for k, v in pairs( nodraw ) do
		if( name == v ) then return false; end
	end
	return true;
end
