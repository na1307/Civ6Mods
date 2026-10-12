-- DTCP_UI
-- Author: Bluehill
-- DateCreated: 2023-06-28 오후 8:44:02
--------------------------------------------------------------

local enableTechPopup:boolean;
local enableCivicPopup:boolean;

local function AddButtonToTopPanel()
	local topPanel = ContextPtr:LookUpControl("/InGame/TopPanel/RightContents");
	Controls.DTCP_Button:ChangeParent(topPanel);
	topPanel:AddChildAtIndex(Controls.DTCP_Button, 3);
	topPanel:CalculateSize();
	topPanel:ReprocessAnchoring();
end

local function ToggleDialogVisibility()
	Controls.DTCP_Panel:SetHide(not Controls.DTCP_Panel:IsHidden());
end

local function OnMenuCloseButtonClick()
	ToggleDialogVisibility();
end

local function OnTopPanelButtonClick()
	ToggleDialogVisibility();
end

local function ToggleTech()
	enableTechPopup = not enableTechPopup;
	GameConfiguration.SetValue('enableTechPopup', enableTechPopup);
end

local function ToggleCivic()
	enableCivicPopup = not enableCivicPopup;
	GameConfiguration.SetValue('enableCivicPopup', enableCivicPopup);
end

local function Initialize()
	Controls.DTCP_Button:RegisterCallback(Mouse.eLClick, OnTopPanelButtonClick);
	Controls.DTCP_OK_Button:RegisterCallback(Mouse.eLClick, OnMenuCloseButtonClick);
	Controls.DTCP_TechCheckBox:RegisterCallback(Mouse.eLClick, ToggleTech);
	Controls.DTCP_CivicCheckBox:RegisterCallback(Mouse.eLClick, ToggleCivic);
	AddButtonToTopPanel();
	ContextPtr:SetHide(false);
	enableTechPopup = false;
	enableCivicPopup = false;
	Controls.DTCP_TechCheckBox:SetCheck(enableTechPopup);
	Controls.DTCP_CivicCheckBox:SetCheck(enableCivicPopup);
	GameConfiguration.SetValue('enableTechPopup', enableTechPopup);
	GameConfiguration.SetValue('enableCivicPopup', enableCivicPopup);
end

local function OnLoadGameViewStateDone()
	Initialize();
end

Events.LoadGameViewStateDone.Add(OnLoadGameViewStateDone);
