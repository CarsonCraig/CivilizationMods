
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IS2Bonuses
----------------------------------------------------------------------------------------------------------------------------
local promotionIS2ID		= GameInfoTypes["PROMOTION_JFD_STALIN_IS2"]
local promotionIS2InfoID	= GameInfoTypes["PROMOTION_JFD_STALIN_IS2_INFO"]

function JFD_IS2Bonuses(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian()) and (not player:IsMinorCiv())) then 
		local unit = player:GetUnitByID(unitID)
		local isUnitInSovietTerritory = false
		if (unit and (unit:IsHasPromotion(promotionIS2InfoID) or unit:IsHasPromotion(promotionIS2ID))) then
			local plot = Map.GetPlot(unit:GetX(), unit:GetY())
			if (plot and (plot:GetOwner() == stalinPlayerID or JFD_IsPlotBelongToSovietUnion(plot))) then
				isUnitInSovietTerritory = true
			end
		end
		
		if isUnitInSovietTerritory then
			if unit:IsHasPromotion(promotionIS2InfoID) then
				unit:SetHasPromotion(promotionIS2InfoID, false)
				unit:SetHasPromotion(promotionIS2ID, true)	
			end
		else
			if unit:IsHasPromotion(promotionIS2ID) then
				unit:SetHasPromotion(promotionIS2InfoID, true)
				unit:SetHasPromotion(promotionIS2ID, false)	
			end
		end		
	end
end
GameEvents.UnitSetXY.Add(JFD_IS2Bonuses)		
--=======================================================================================================================
--=======================================================================================================================