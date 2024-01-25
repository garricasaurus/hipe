local _, hipe = ...

local aura = {
    player = "player"
}

function aura:remove(spellId)
    local idx = self:find(spellId)
    if idx and not InCombatLockdown() then
        CancelUnitBuff(self.player, idx, "HELPFUL")
    end
end

function aura:find(spellId)
    for i = 1, 40 do
        local buffId = select(10, UnitBuff(self.player, i))
        if buffId == nil then
            break
        elseif buffId == spellId then
            return i
        end
    end
    return nil
end

hipe.aura = aura
