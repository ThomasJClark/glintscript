local function ESDMenuIsOpen(menuType)
    return ESD.CheckSpecificPersonMenuIsOpen(menuType, 0) and not ESD.CheckSpecificPersonGenericDialogIsOpen(0)
end

InitializeEvent(function()
    WaitFor(function() return EMEVD.ActionButtonInArea(6200, 1042360711) end)

    while true do
        ESD.ClearTalkListData()
        ESD.AddTalkListData(1, 20000010, -1)  -- Purchase
        ESD.AddTalkListData(2, 20000011, -1)  -- Sell
        ESD.AddTalkListData(99, 20000009, -1) -- Leave
        ESD.ShowShopMessage(1)
        WaitFor(function() return not ESDMenuIsOpen(1) end)

        if ESD.GetTalkListEntryResult() == 1 then
            ESD.OpenRegularShop(100500, 100524)
            WaitFor(function() return not ESDMenuIsOpen(5) end)
        elseif ESD.GetTalkListEntryResult() == 2 then
            ESD.OpenSellShop(-1, -1)
            WaitFor(function() return not ESDMenuIsOpen(6) end)
        else
            RestartEvent()
        end
    end
end)
