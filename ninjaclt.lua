
do
	local nt = CreateFrame ("frame")
	local AddonName = ninjaCLT
	nt:RegisterEvent ("ADDON_LOADED")
	
	local ninjaTweaks = function()
		if (not InCombatLockdown()) then
			SetCVar ("SpellQueueWindow", 0)
			SetCVar ("cameraDistanceMaxZoomFactor", 2.6)
			SetCVar ("alwaysCompareItems", 1)
			MoveViewOutStart (50000)
			nt.Ticker:Cancel()
			nt = nil
		end
	end
	
	nt:SetScript ("OnEvent", function (self, event, ninjaCLT)
		if (AddonName == ninjaCLT) then
			nt.Ticker = C_Timer.NewTicker (1, ninjaTweaks)
			nt:UnregisterEvent ("ADDON_LOADED")
			AddonName = nil
		end
	end)
end
