"""
    getchannelhistory(token::String)
Takes in the Slack App Auth token and channel ID.

Tokens can be accessed at "https://api.slack.com/apps/random-letters-and-numbers/oauth?"
"""
function getchannelhistory(token::String, channelid::String)
    HTTP.setuseragent!("HTTP.jl")

    url = "https://slack.com/api/conversations.history?token=$(token)&channel=$(channelid)"

    r = HTTP.get(url, ["Content-Type" => "application/json"])

    json_obj = JSON.parse(String(r.body))
    message_holder = []
    for (k,v) in json_obj
        if occursin("messages", k)
            for item in v
                for (key,value) in item
                    if key == "client_msg_id"
                        println("client_msg_id: $(value)")
                    elseif key == "text"
                        println("text: $(value)")
                    end
                end
            end
        end
    end

end
