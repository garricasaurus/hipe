local _, hipe = ...

hipe.CreateText = function(frame, text, style, width)
    local s = frame:CreateFontString(nil, "ARTWORK", style)
    s:SetWidth(width or 300)
    s:SetJustifyH("LEFT")
    s:SetText(text)
    return s
end

hipe.CreateCheckbox = function(frame, text)
    local chekbox = CreateFrame("CheckButton", nil, frame, "UICheckButtonTemplate")
    chekbox["text"]:SetText(text)
    return chekbox
end
