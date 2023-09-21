-- TechCivicCompletedPopup_DTCP
-- Author: Bluehill
-- DateCreated: 2023-09-19 오후 5:00:16
--------------------------------------------------------------

include("TechCivicCompletedPopup.lua");

Base_AddCompletedPopup = AddCompletedPopup;

function AddCompletedPopup( player:number, civic:number, tech:number, isByUser:boolean )
	if (tech and not GameConfiguration.GetValue('enableTechPopup')) or (civic and not GameConfiguration.GetValue('enableCivicPopup')) then
		return;
	end

	Base_AddCompletedPopup(player, civic, tech, isByUser);
end
