"""
    getthreads(token::String)
Takes in the Slack App Auth token, channel ID, and Time Signature of the parent message.

https://api.slack.com/methods/conversations.replies#arg_ts
"""
function getthreads(token::String, channelid::String, ts::String)
    HTTP.setuseragent!("HTTP.jl")

    url = "https://slack.com/api/conversations.replies?token=$(token)&channel=$(channelid)&ts=$(ts)&limit=50"

    r = HTTP.get(url, ["Content-Type" => "application/json"])

    json_obj = JSON.parse(String(r.body))
    message_holder = []
    for (k,v) in json_obj
        if occursin("messages", k)
            for item in v
                for (key,value) in item
                    if key == "text"
                        println(value)
                    elseif key == "user"
                        println("User with ID $(value) said:")
                    end
                end
            end
        end
    end

end
