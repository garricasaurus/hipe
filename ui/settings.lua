local name, hipe = ...

local frame = CreateFrame("Frame", "HipeSettingsFrame")

local title = hipe.CreateText(frame, hipe.settingsTitle, "GameFontNormalLarge")

local instantHideHint = hipe.CreateText(frame, hipe.instantHideHint, "GameFontHighlightSmall")
local instantHideCheckbox = hipe.CreateCheckbox(frame, hipe.instantHideText)

local ignoreFishingHint = hipe.CreateText(frame, hipe.ignoreFishingHint, "GameFontHighlightSmall")
local ignoreFishingCheckbox = hipe.CreateCheckbox(frame, hipe.ignoreFishingText)

title:SetPoint("TOPLEFT", 20, -20)
instantHideCheckbox:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -40)
instantHideHint:SetPoint("LEFT", instantHideCheckbox, "RIGHT", 200, 0)
ignoreFishingCheckbox:SetPoint("TOPLEFT", instantHideCheckbox, "BOTTOMLEFT", 0, -80)
ignoreFishingHint:SetPoint("LEFT", ignoreFishingCheckbox, "RIGHT", 200, 0)

function frame:OnRefresh()
    instantHideCheckbox:SetChecked(HipeConf.instantHide)
    ignoreFishingCheckbox:SetChecked(HipeConf.ignoreFishing)
end

function frame:OnCommit()
    HipeConf.instantHide = instantHideCheckbox:GetChecked()
    HipeConf.ignoreFishing = ignoreFishingCheckbox:GetChecked()
end

function frame:OnDefault()
    HipeConf = hipe.defaults
end

-- integrate with options menu
local settings = Settings.RegisterCanvasLayoutCategory(frame, name)
settings.ID = name

Settings.RegisterAddOnCategory(settings)
