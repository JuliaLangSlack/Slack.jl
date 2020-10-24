"""
    getchannelhistory(token::String)
Takes in the Slack App Auth token and channel ID.

Returns the 800 most recent messags (this may not be the case always). Could be time based...

Tokens can be accessed at "https://api.slack.com/apps/random-letters-and-numbers/oauth?"
"""
function getchannelhistory(token::String, channelid::String)

    HTTP.setuseragent!("HTTP.jl")
    url = "https://slack.com/api/conversations.history?token=$(token)&channel=$(channelid)"
    r = HTTP.get(url, ["Content-Type" => "application/json"])

    json_obj = JSON.parse(String(r.body))
    message_holder = []

    #TODO: Need to figure out a parameter to constrain the time period in which messages are returned.

    for (k,v) in json_obj
        if occursin("messages", k)
            for item in v

                # Declare the holder variables
                edited = false
                ts = ""
                thread_ts = ""
                user = ""
                text = ""

                # println("Starting to parse a new message") #DEBUG
                for (key,value) in item
                    if key == "edited"
                        edited = true

                    # TODO: also convert this to Date Time and add that for print out.
                    elseif key == "ts"
                        ts = value

                    elseif key == "text"
                        text = value

                    elseif key == "user"
                        user = value

                    # It's a thread not a message...
                    elseif key == "thread_ts"
                        thread_ts = value
                    end
                end

                # If ts and thread_ts are the same, then this is a thread so call the thread function
                if ts == thread_ts && ts != ""

                    try
                        thread_msg = getthreads(token, channelid, ts)
                        push!(message_holder, thread_msg)
                    catch
                        println("Failed to create a threaded message object")
                    end

                # Else it's a normal message so create it here and push it into an array.
                else
                    msg = message(edited, ts, user, text)
                    push!(message_holder, msg)
                end
            end
        end
    end

    return(message_holder)

end
