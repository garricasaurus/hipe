local _, hipe = ...

local blocker = {
    blocked = {
        [394011] = true,
    }
}

local aura = hipe.aura

function blocker:removeIfBlocked(spellId)
    if self.blocked[spellId] then
        aura:remove(spellId)
    end
end

function blocker:removeAllBlocked()
    for k in pairs(self.blocked) do
        aura:remove(k)
    end
end

hipe.blocker = blocker