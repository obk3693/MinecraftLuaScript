function getScript(link)
    local request = http.get(link)
    return request.readAll()
end

function readFile(fileName)
    local file = fs.open(fileName, "r")
    return file.readAll()
end

function start()
    local link = "https://gist.githubusercontent.com/obk3693/3632c6079fa70812fb4e28e678996288/raw/bad3f482d8aa1dee26ca6c0fc00ae659268b167f/harvestPotatoBot.lua"
    local fileName = "harvestPotatoBot.lua"
    local gistFile = getScript(link)

    local localFile = readFile(fileName)

    if(gistFile == localFile)
    then
        print("No changes were made")
    else
        print("Updating to the latest file...")
        byteDiff = math.abs(string.len(gistFile) - string.len(localFile))
        print(byteDiff .. " bytes updated")
        local file = fs.open(fileName, "w")
        file.write(gistFile)
        file.close()
    end
end

start()