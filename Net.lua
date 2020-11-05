local json = require "json"
local Server = {}

function Server.Send(id, Msg) 
    rednet.send(id, json.encode(Msg))
end

function Server.Recive()
    e, s, m, d = os.pullEvent()
    if (e == "rednet_message") then
        return {
            U = true,
            Event = e,
            Sender = s,
            Message = json.decode(m)
        }
    else
        return {
            U = false,
            Event = e,
            Sender = s
        }
    end
end

return Server
