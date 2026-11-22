local Runner = {
    started = false,
    timeout = 900,
    data = {
        direction = 1,
        startedTime = 0,
        dolmensClosed = 0,
        xpPerMinute = 0,
        minutesToLevel = 0,
        hoursToLevel = 0,
        currentDolmen = 0,
        lastDomen = 0,
        beforeLastDolmen = 0,
        events = {}
    },
    defaultData = {
        direction = 1,
        startedTime = 0,
        dolmensClosed = 0,
        xpPerMinute = 0,
        minutesToLevel = 0,
        hoursToLevel = 0,
        currentDolmen = 0,
        lastDolmen = 0,
        beforeLastDolmen = 0,
        events = {}
    },
    directions = {
        cw = 1,
        ccw = -1
    },
    wayshrines = {
        -- Alik'r Desert
        [59] = { region="Alik'r Desert", cw = 60, ccw = 155},
        [60] = { region="Alik'r Desert", cw = 155, ccw = 59},
        [155] = { region="Alik'r Desert", cw = 59, ccw = 60},
        
        -- Auridon
        [127] = { region="Auridon", cw = 175, ccw = 176},
        [175] = { region="Auridon", cw = 176, ccw = 127},
        [176] = { region="Auridon", cw = 127, ccw = 175},
        
        -- Bangkorai
        [35] = { region="Bangkorai", cw = 39, ccw = 206},
        [39] = { region="Bangkorai", cw = 206, ccw = 35},
        [206] = { region="Bangkorai", cw = 35, ccw = 39},
        
        -- Deshaan
        [27] = { region="Deshaan", cw = 80, ccw = 30},
        [30] = { region="Deshaan", cw = 27, ccw = 80},
        [80] = { region="Deshaan", cw = 30, ccw = 27},
        
        -- Eastmarch
        [90] = { region="Eastmarch", cw = 95, ccw = 92},
        [92] = { region="Eastmarch", cw = 90, ccw = 95},
        [95] = { region="Eastmarch", cw = 92, ccw = 90},
        
        -- Galen (Random Rotation)
        
        -- Glenumbra
        [2] = { region="Glenumbra", cw = 20, ccw = 6},
        [6] = { region="Glenumbra", cw = 2, ccw = 20},
        [20] = { region="Glenumbra", cw = 6, ccw = 2},
        
        -- Grahtwood
        [21] = { region="Grahtwood", cw = 207, ccw = 164},
        [164] = { region="Grahtwood", cw = 21, ccw = 207},
        [207] = { region="Grahtwood", cw = 164, ccw = 21},
        
        -- Greenshade
        [148] = { region="Greenshade", cw = 152, ccw = 149},
        [149] = { region="Greenshade", cw = 148, ccw = 152},
        [152] = { region="Greenshade", cw = 149, ccw = 148},
        
        -- High Isle (Random Rotation)
        
        -- Malabal Tor
        [100] = { region="Malabal Tor", cw = 105, ccw = 104},       -- Vulkwasten
        [104] = { region="Malabal Tor", cw = 100, ccw = 105},       -- Abamath
        [105] = { region="Malabal Tor", cw = 104, ccw = 100},       -- Wilding Run
        
        -- Northern Elsweyr 397 387 386
        [397] = { region="Northern Elsweyr", cw = 387, ccw = 386},  -- Star Haven
        [387] = { region="Northern Elsweyr", cw = 386, ccw = 397},  -- Hakoshae
        [386] = { region="Northern Elsweyr", cw = 397, ccw = 387},  -- Scar's End
        
        -- Reaper's March
        [157] = { region="Reaper's March", cw = 161, ccw = 158},    -- Fort Sphinxmoth
        [158] = { region="Reaper's March", cw = 157, ccw = 161},    -- Arenthia
        [161] = { region="Reaper's March", cw = 158, ccw = 157},    -- Moonmont
        
        -- Rivenspire
        [10] = { region="Rivenspire", cw = 13, ccw = 86},
        [13] = { region="Rivenspire", cw = 86, ccw = 10},
        [86] = { region="Rivenspire", cw = 10, ccw = 13},
        
        -- Shadowfen
        [47] = { region="Shadowfen", cw = 51, ccw = 53},
        [51] = { region="Shadowfen", cw = 53, ccw = 47},
        [53] = { region="Shadowfen", cw = 47, ccw = 51},
        
        -- Solstice (Random Rotation)
        
        -- Southern Elsweyr 403 406
        [403] = { region="Southern Elsweyr", cw = 406, ccw = 406},  -- South Guard Ruins
        [406] = { region="Southern Elsweyr", cw = 403, ccw = 403},  -- Pridehome
        
        -- Stonefalls
        [67] = { region="Stonefalls", cw = 71, ccw = 73},
        [71] = { region="Stonefalls", cw = 73, ccw = 67},
        [73] = { region="Stonefalls", cw = 67, ccw = 71},
        
        -- Stormhaven
        [17] = { region="Stormhaven", cw = 19, ccw = 31},
        [19] = { region="Stormhaven", cw = 31, ccw = 17},
        [31] = { region="Stormhaven", cw = 17, ccw = 19},
        
        -- Summerset 349 357 365 353 354 358
        [349] = { region="Summerset", cw = 357, ccw = 358},         -- King's Haven Pass
        [357] = { region="Summerset", cw = 365, ccw = 354},         -- Eastern Pass
        [365] = { region="Summerset", cw = 353, ccw = 353},         -- Sunhold
        [353] = { region="Summerset", cw = 354, ccw = 365},         -- Cey-Tarn Keep
        [354] = { region="Summerset", cw = 358, ccw = 357},         -- Ebon Stadmont
        [358] = { region="Summerset", cw = 349, ccw = 349},         -- The Crystal Tower
        
        -- The Reach 442 444 441 443
        [442] = { region="The Reach", cw = 444, ccw = 443},         -- Druadach Mountains
        [444] = { region="The Reach", cw = 441, ccw = 442},         -- Lost Valley
        [441] = { region="The Reach", cw = 443, ccw = 444},         -- Briar Rock
        [443] = { region="The Reach", cw = 442, ccw = 441},         -- North Markarth
        
        -- The Rift
        [110] = { region="The Rift", cw = 116, ccw = 114},
        [114] = { region="The Rift", cw = 110, ccw = 116},
        [116] = { region="The Rift", cw = 114, ccw = 110},
        
        -- West Weald (Random Rotation)

        -- Western Skyrim (Random Rotation)
    }
}

function Runner:Start()
    LeoDolmenRunner.log("Starting runner")
    local direction = Runner.data.direction
    local lastDolmen = Runner.data.lastDolmen or 0
    local beforeLastDolmen = Runner.data.beforeLastDolmen or 0
    ZO_ShallowTableCopy(Runner.defaultData, Runner.data)
    Runner.data.startedTime = GetTimeStamp()
    Runner.data.direction = direction
    Runner.data.lastDolmen = lastDolmen
    Runner.data.beforeLastDolmen = beforeLastDolmen
    Runner.started = true
    LeoDolmenRunnerWindowPanelStartStopLabel:SetText("Stop")
    LeoDolmenRunner.ui:CreateUI()
end

function Runner:Stop()
    LeoDolmenRunner.log("Stopping runner")
    Runner.started = false
    LeoDolmenRunnerWindowPanelStartStopLabel:SetText("Start")
end

function Runner:StartStop()
    if Runner.started then
        Runner:Stop()
    else
        Runner:Start()
    end
end

function Runner:CW()
    LeoDolmenRunner.log("Changing direction to clock wise")
    Runner.data.direction = Runner.directions.cw
    LeoDolmenRunnerWindowPanelOrientationLabel:SetText("CW")
end

function Runner:CCW()
    LeoDolmenRunner.log("Changing direction to counter clock wise")
    Runner.data.direction = Runner.directions.ccw
    LeoDolmenRunnerWindowPanelOrientationLabel:SetText("CCW")
end

function Runner:CWCCW()
    if Runner.data.direction == Runner.directions.cw then
        Runner:CCW()
    else
        Runner:CW()
    end
end

function Runner:OnFastTravelInteraction(currentWayshrine)
    if not Runner.started or Runner.wayshrines[currentWayshrine] == nil then return end

    local nextWayshrine = nil
    if Runner.data.direction == Runner.directions.cw then
        nextWayshrine = Runner.wayshrines[currentWayshrine].cw
    else
        nextWayshrine = Runner.wayshrines[currentWayshrine].ccw
    end

    local discovered, name = GetFastTravelNodeInfo(nextWayshrine)
    if not discovered then
        LeoDolmenRunner.log("Can't fast travel: " .. name .. " not discovered yet.")
        return
    end

    FastTravelToNode(nextWayshrine)
end

local function calculateXpPerMinute(xp, timestamp)
    local diff = GetDiffBetweenTimeStamps(GetTimeStamp(), timestamp)
    diff = (diff == 0) and 1 or diff

    return xp / (diff / 60)
end

local function TimeToLevel()
    local xpToLevel = 0
    if (CanUnitGainChampionPoints("player")) then
        xpToLevel = GetNumChampionXPInChampionPoint(GetPlayerChampionPointsEarned("player")) - GetPlayerChampionXP()
    else
        xpToLevel = GetNumExperiencePointsInLevel(GetUnitLevel("player")) - GetUnitXP("player")
    end

    local minutesToLevel = math.ceil(xpToLevel / Runner.data.xpPerMinute)

    if minutesToLevel < 60 then return 0, minutesToLevel end

    local hoursToLevel = math.floor(minutesToLevel / 60)
    minutesToLevel = minutesToLevel - (hoursToLevel * 60)

    return hoursToLevel, minutesToLevel
end

function Runner:UpdateData()
    local xpGained = 0
    local firstEventTimestamp = 0
    local now = GetTimeStamp()

    for i = #Runner.data.events, 1, -1 do
        local event = Runner.data.events[i]
        if GetDiffBetweenTimeStamps(now, event.timestamp) > Runner.timeout then
            table.remove(Runner.data.events, i)
        else
            xpGained = xpGained + event.xp
            if firstEventTimestamp == 0 or event.timestamp < firstEventTimestamp then
                firstEventTimestamp = event.timestamp
            end
        end
    end

    Runner.data.xpPerMinute = calculateXpPerMinute(xpGained, firstEventTimestamp)

    if xpGained > 0 then
        Runner.data.hoursToLevel, Runner.data.minutesToLevel = TimeToLevel()
    else
        Runner.data.hoursToLevel, Runner.data.minutesToLevel = 0, 0
    end
end

function Runner:Update(tick)
    if not Runner.started or tick ~= 5 then return end

    self:UpdateData()
end

local assistants = {
    267,    -- Tythis Andromo, the Banker
    300,    -- Nuzhimeh the Merchant
    301,    -- Pirharri the Smuggler
    396,    -- Allaria Erwen the Exporter
    397,    -- Cassus Andronicus the Mercenary
    6376,   -- Ezabi the Banker
    6378,   -- Fezez the Merchant
    8994,   -- Baron Jangleplume, the Banker
    8995,   -- Peddler of Prizes, the Merchant
    9743,   -- Factotum Property Steward
    9744,   -- Factotum Commerce Delegate
    9745,   -- Ghrasharog, Armory Assistant
    10184,  -- Giladil the Ragpicker
    10617,  -- Aderene, Fargrave Dregs Dealer
    10618,  -- Zuqoth, Armory Advisor
    11059,  -- Hoarfrost, Takubar Trader
    11097,  -- Pyroclast, Infernace Conservator
    11876,  -- Drinweth, Valenwood Armorer
    11877,  -- Tzozabrar, Dwarven Deconstructor
    12413,  -- Eri, Barking Banker
    12414,  -- Xyn, Planar Purveyor
    13063,  -- Siluruz, Realm Craftsmaster
    13066,  -- Terilorne, Dibellan Freetrader
    13517,  -- Celia Tyde, Lost Fleet Bursar
    13518,  -- Voko, Carnaval Weapondancer
    14018,  -- Pontius Remus, Lupine Scavenger
    14204   -- Cambio Zammes, Rooster in Exile
}

function Runner:OnCombatState(inCombat)
    if not Runner.started then return end

    if IsUnitDead("player") then
        zo_callLater(function() Runner:OnCombatState(inCombat) end, 500)
        return
    end

    if inCombat and LeoDolmenRunner.settings.runner.autoDismiss then
        for _, id in pairs(assistants) do
            if IsCollectibleActive(id) then
                LeoDolmenRunner.log("Dismissing " .. GetCollectibleInfo(id))
                UseCollectible(id)
            end
        end
    end
end

function Runner:OnExperienceGain(reason, level, previousExperience, currentExperience, championPoints)
    if not Runner.started then return end

    local event = {
        timestamp = GetTimeStamp(),
        xp = currentExperience - previousExperience
    }
    table.insert(Runner.data.events, event)

    Runner.data.currentDolmen = Runner.data.currentDolmen + event.xp

    if reason == 7 then
        Runner.data.dolmensClosed = Runner.data.dolmensClosed + 1
        Runner.data.beforeLastDolmen = Runner.data.lastDolmen
        Runner.data.lastDolmen = Runner.data.currentDolmen
        Runner.data.currentDolmen = 0
    end

    self:UpdateData()
end

function Runner:Initialize()
end

LeoDolmenRunner.runner = Runner
