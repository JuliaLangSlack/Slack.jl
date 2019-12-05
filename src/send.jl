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
function sendattachmenttoslack(data::String, user_endpoint::String)
    HTTP.setuseragent!("HTTP.jl")


    params = Dict("attachments"=>"$(data)")
    base_url = "https://hooks.slack.com"

    endpoint = user_endpoint
    url = base_url * endpoint

    r = HTTP.post(url,
                 ["Content-Type" => "application/json"],
                 JSON.json(params))

    return (String(r.body))
end
