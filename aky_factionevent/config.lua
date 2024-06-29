config = {}
locale = GetConvar('aky:locale', 'en')

notify = "aky" -- aky/esx/ox

config.blips = {
    {
        name = "Faction Event 1",
        pos = vector3(198.5777, 1165.5731, 227.0094)
    },
    {
        name = "Faction Event 2",
        pos = vector3(-415.2957, 1160.9026, 325.8590)
    },
}

function GetTranslation(key)
    local lang = locale or 'en'
    local langFilePath = 'locales/' .. lang .. '.lua'

    local langFileContent = LoadResourceFile(GetCurrentResourceName(), langFilePath)

    if langFileContent then
        local langTranslations = load(langFileContent)()

        if langTranslations and langTranslations[key] then
            return langTranslations[key]
        else
            return key
        end
    else
        return "[" .. lang .. "] Translation file not found or unable to load: " .. langFilePath
    end
end
