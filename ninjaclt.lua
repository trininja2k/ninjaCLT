
do
	local f = CreateFrame ("frame")
	local AddonName = ...
	f:RegisterEvent ("ADDON_LOADED")
	
	local AdjustCustomLagTolerance = function()
		if (not InCombatLockdown()) then
			SetCVar ("SpellQueueWindow", 0)
			f.Ticker:Cancel()
			f = nil
		end
	end
	
	f:SetScript ("OnEvent", function (self, event, ...)
		if (AddonName == ...) then
			f.Ticker = C_Timer.NewTicker (1, AdjustCustomLagTolerance)
			f:UnregisterEvent ("ADDON_LOADED")
			AddonName = nil
		end
	end)
end