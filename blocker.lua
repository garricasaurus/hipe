local _, hipe = ...

local blocker = {
    blocked = {
        [394003] = "Spark of Madness",
        [388658] = "Suited For Smithing",
        [394015] = "An Eye For Shine",
        [394008] = "A Looker's Charm",
        [394007] = "A Production-Grade Display",
        [394016] = "Artist's Duds",
        [394001] = "Sculpting Leather Finery",
        [391312] = "Wrapped Up In Weaving",
        [391775] = "What's Cookin', Good Lookin'?",
        [394009] = "Fishing For Attention",
        [394005] = "A Cultivator's Colors",
        [394006] = "Rockin' Mining Gear",
        [394011] = "Dressed To Kill",
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