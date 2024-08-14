local _, hipe = ...

local aura = {
    player = "player",
    filter = "HELPFUL|CANCELABLE",
}

function aura:remove(spellId)
    local idx = self:find(spellId)
    if idx and not InCombatLockdown() then
        CancelUnitBuff(self.player, idx, self.filter)
    end
end

function aura:find(spellId)
    for i = 1, 40 do
        local buffData = C_UnitAuras.GetBuffDataByIndex(self.player, i, self.filter)
        if buffData == nil then
            break
        elseif spellId == buffData.spellId then
            return i
        end
    end
    return nil
end

hipe.aura = aura
