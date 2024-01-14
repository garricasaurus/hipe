local _, hipe = ...

local blocker = hipe.blocker

---@class Frame
local frame = CreateFrame("Frame")
frame:RegisterUnitEvent("UNIT_AURA", "player")
frame:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_STOP", "player")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:SetScript("OnEvent", function(self, event, ...)
    self[event](self, ...)
end)

function frame:UNIT_AURA(_, updateInfo)
    if updateInfo and updateInfo.addedAuras then
        for _, aura in pairs(updateInfo.addedAuras) do
            blocker:removeIfBlocked(aura.spellId)
        end
    end
end

function frame:UNIT_SPELLCAST_CHANNEL_STOP(_, _, _, _, spellId)
    blocker:removeIfBlocked(spellId)    -- fishing
end

function frame:PLAYER_REGEN_ENABLED()
    blocker:removeAllBlocked()
end