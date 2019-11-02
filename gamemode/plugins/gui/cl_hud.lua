local function DeathScreen()
 local TR = rp.Config.Death.TimeRevive
 local Screen = ui.Create("ui_frame")
 local tick = 0
 timer.Create("revive_timer", 1, TR, function() tick = tick + 1  if (tick==TR) then Screen:Close(); net.Start("revive") net.SendToServer() end end) 
		Screen:SetSize(ScrW(), ScrH())
		Screen:Center()
		Screen:SetVisible(true)
		Screen:SetTitle( "" )
		Screen:ShowCloseButton( false )
		Screen.Paint = function(self)
			surface.SetDrawColor(0,0,0)
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
		end
end
local active = false
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

local Page = Material("icon16/page_white_text.png")
local function GunLicense()
    if LocalPlayer():GetNetVar("Gunlicense") then
        surface.SetMaterial(Page)
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(290,  ScrH() - 75, 17, 17)
    end
end

function InfoHud() 
	if !LocalPlayer():Alive() then return end
	surface.SetFont("Default")
	local creditsw, creditsh = surface.GetTextSize(rp.formatMoney(LocalPlayer():GetMoney()));
	local nickw, nickh = surface.GetTextSize( LocalPlayer():GetName() );
	local jobtitlew, jobtitleh = surface.GetTextSize(LocalPlayer():GetJobTitle());
	pboxw = 0;
	if( nickw > jobtitlew ) then
		pboxw = nickw+20;
	end
	if( nickw < jobtitlew ) then
		pboxw = jobtitlew+25;
	end
	if( creditsw > pboxw ) then
		pboxw = creditsw+30;
	end
	draw.RoundedBox( 4, 10, ScrH() - 100, 106+pboxw , 85, Color( 100, 100, 100, 150 ) )
	draw.RoundedBox( 4, 13, ScrH() - 97, 100+pboxw , 79, Color( 0, 0, 0, 200 ) )
	draw.RoundedBox( 4, 10, ScrH() - 100, 106+pboxw , 20, Color( 100, 100, 100, 200 ) )
	draw.SimpleText(LocalPlayer():GetName(), "ChatFont", 20,  ScrH() - 100, Color(255, 255, 255, 255), 0, 0)  
	draw.SimpleText(LocalPlayer():GetMoney() .. rp.Config.Currency, "ChatFont", 20,  ScrH() - 75, Color(255, 255, 255, 255), 0, 0)  
	draw.SimpleText(LocalPlayer():GetJobTitle(), "ChatFont", 20,  ScrH() - 50, Color(255, 255, 255, 255), 0, 0) 
	GunLicense()
end                                                                
hook.Add("HUDPaint", "InfoHud", InfoHud)  

function DrawOutlinedMeter( amt, thickness, x, y, w, h, clr )
	draw.RoundedBox( 4, x-2, y-2, w+4, h+4, Color( 150, 0, 0, 50 ) );
	draw.RoundedBox( 4, x, y, w, h, Color( 0, 0, 0, 255 ) );
	if(  amt > 0.0 ) then
		draw.RoundedBox( 4, x + thickness, y + thickness, ( w - thickness * 2 ) * amt, h - thickness * 2, clr );	
	end
	if( amt > 0.8 ) then
		draw.RoundedBox( 4, x + thickness, y + thickness, ( w - thickness * 2 ) * amt, h - thickness * 2, Color( 75, 0, 0, 255 ) );	
	end
	if(  amt <= 0.8 && amt >= 0.5 ) then
		draw.RoundedBox( 4, x + thickness, y + thickness, ( w - thickness * 2 ) * amt, h - thickness * 2, clr );	
	end
	if( amt < 0.5 && amt >= 0.3 ) then
		draw.RoundedBox( 4, x + thickness, y + thickness, ( w - thickness * 2 ) * amt, h - thickness * 2, Color( 200, 0, 0, 255 ) );	
	end
	if( amt < 0.3 && amt > 0.0 ) then
		draw.RoundedBox( 4, x + thickness, y + thickness, ( w - thickness * 2 ) * amt, h - thickness * 2, Color( 255, 0, 0, 255 ) );	
	end
end

function DrawOutlinedMeterArmor( amt, thickness, x, y, w, h, clr )
	draw.RoundedBox( 4, x-2, y-2, w+4, h+4, Color( 0, 0, 0, 100 ) );
	draw.RoundedBox( 4, x, y, w, h, Color( 0, 0, 0, 255 ) );
	if(  amt > 0.0 ) then
		draw.RoundedBox( 4, x + thickness, y + thickness, ( w - thickness * 2 ) * amt, h - thickness * 2, clr );	
	end
	if(  amt <= 0.8 && amt >= 0.5 ) then
		draw.RoundedBox( 4, x + thickness, y + thickness, ( w - thickness * 2 ) * amt, h - thickness * 2, clr );	
	end
	if( amt < 0.5 && amt >= 0.3 ) then
		draw.RoundedBox( 4, x + thickness, y + thickness, ( w - thickness * 2 ) * amt, h - thickness * 2, Color( 0,255,255, 255 ) );	
	end
	if( amt < 0.3 && amt > 0.0 ) then
		draw.RoundedBox( 4, x + thickness, y + thickness, ( w - thickness * 2 ) * amt, h - thickness * 2, Color( 64,224,208, 255 ) );	
	end
end
	 
	 
//HudPaint
function GM:HUDPaint()
	if (rp.Config.HUD.DeathScreen) then
	if (LocalPlayer():Alive()) then active = false end
	if( not LocalPlayer():Alive() and active == false) then DeathScreen() active = true; return; end end
	if (rp.Config.HUD.Effects) then
	DrawDamagedDisplay(); end
	if (rp.Config.HUD.ShowHP) then
	DrawOutlinedMeter( LocalPlayer():Health() / 100, 2, ScrW() * .33, 5, ScrW() * .33, 16, Color( 150, 0, 0, 255 ) ); end
	if (rp.Config.HUD.ShowArmor) then
	DrawOutlinedMeterArmor( LocalPlayer():Armor() / 100, 2, ScrW() * .33, 30, ScrW() * .33, 16, Color( 0, 0, 128, 255 ) ); end
end

function GM:HUDShouldDraw( name )
	local nodraw = 
	{
		"CHudHealth",
		"CHudAmmo",
		"CHudSecondaryAmmo",
		"CHudBattery",
		"CHudWeaponSelection"
	}
	for k, v in pairs( nodraw ) do
		if( name == v ) then return false; end
	end
	return true;
end
