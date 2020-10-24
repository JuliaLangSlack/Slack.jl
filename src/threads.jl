"""
    getthreads(token::String)
Takes in the Slack App Auth token, channel ID, and Time Signature of the parent message.
Return the first 50 replies ina  thread.

https://api.slack.com/methods/conversations.replies#arg_ts
"""
function getthreads(token::String, channelid::String, ts::String)
    HTTP.setuseragent!("HTTP.jl")

    # TODO: 50 is an arbitary number, see if there is a limit.
    url = "https://slack.com/api/conversations.replies?token=$(token)&channel=$(channelid)&ts=$(ts)&limit=50"

    r = HTTP.get(url, ["Content-Type" => "application/json"])
    message_holder = []

    json_obj = JSON.parse(String(r.body))
    message_holder = []
    for (k,v) in json_obj
        if occursin("messages", k)
            for item in v

                # Declare the holder variables
                edited = false
                ts = ""
                thread_ts = ""
                user = ""
                text = ""

                # println("Starting to look through next Dict/Object") #DEBUG
                for (key, value) in item
                    if key == "user"
                        user = value

                    elseif key == "edited"
                        edited = true

                    elseif key == "ts"
                        ts = value

                    elseif key == "thread_ts"
                        thread_ts = value

                    elseif key == "text"
                        text = value
                    end
                end

                # Create the message object.. Handle a failed parse and object creation error.
                try
                    new_tm = threadedMessage(edited, ts, thread_ts, user, text)

                    # Push it into the holder array
                    push!(message_holder, new_tm)
                catch
                    println("Enabled to created a threaded message with the following details: $(edited), $(ts), $(thread_ts), $(user), $(text)")
                end

            end
        end
    end

    # Create and Return the Thread object (just an array of messages)
    return(message_holder)

end
