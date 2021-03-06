local discord_webhook = {
    url = "",
    image = "https://tenor.com/view/new-city-gif-17972895"
-- POST REQUEST
AddEventHandler("chatMessage", function(source, author, text)
    PerformHttpRequest(discord_webhook.url, 
    function(err, text, header) end, 
    'POST', 
    json.encode({username = author, content = text, avatar_url=discord_webhook.image }), {['Content-Type'] = 'application/json'}) 
    --[[ we will set the username of the webhook as the username of the person ig and the content of the webhook will be whatever the user says in chat ]]
end)

-- GET REQUEST
RegisterCommand("getspace", function(source, args)
    PerformHttpRequest("http://api.open-notify.org/astros.json" --[[ this url is a free api that will tell you how many people are in space ]], 
    function(err, text, header) 
        local data = json.decode(text)
        print(text)
        TriggerClientEvent("chat:addMessage", source, { args = {string.format("There are currently %s people in space", data.number)} })
    end, 
    'GET', 
    json.encode({}), {['Content-Type'] = 'application/json'})
end)

