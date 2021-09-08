using Slack

"""
    sendtoslack(data::String, user_endpoint::String)
Takes in a string of data and the endpoint url and returns the HTTP response.
The response will be "ok" if the request is sent successfully.
"""
function sendtoslack(data::String, user_endpoint::String)
    HTTP.setuseragent!("HTTP.jl")


    params = Dict("text"=>"$(data)")
    base_url = "https://hooks.slack.com"

    endpoint = user_endpoint
    url = base_url * endpoint

    r = HTTP.post(url,
                 ["Content-Type" => "application/json"],
                 JSON.json(params))

    return (String(r.body))
end

"""
    sendattachmenttoslack(data::String, user_endpoint::String)
Takes in a string of data and the endpoint url and returns the HTTP response.
The response will be "ok" if the request is sent successfully.
"""
function sendattachmenttoslack(data, user_endpoint::String)
    HTTP.setuseragent!("HTTP.jl")


    params = data
    base_url = "https://hooks.slack.com"

    endpoint = user_endpoint
    url = base_url * endpoint

    r = HTTP.post(url,
                 ["Content-Type" => "application/json"],
                 JSON.json(params))

    return (String(r.body))
end

"""
    sendfiletoslack(filepath, channel, token)

Sends a file with a message to the specified channel.
https://api.slack.com/methods/files.upload
"""
function sendfiletoslack(filepath, message, channel, token)
    HTTP.setuseragent!("HTTP.jl")


    url = "https://slack.com/api/files.upload"
    headers = Dict("Authorization"=>"Bearer $token")
    data = Dict(
        "file" => open(filepath),
        "initial_comment" => message,
        "channels" => channel
    )
    body = HTTP.Form(data)

    r = HTTP.post(url, headers, body)

    return (String(r.body))
end
