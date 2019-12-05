using Slack

"""
    getchannels(token::String)
"""
function getchannels(token::String)

    HTTP.setuseragent!("HTTP.jl")

    url = "https://slack.com/api/conversations.list?token=$(token)"

    r = HTTP.get(url, ["Content-Type" => "application/json"])

    return (String(r.body))

end
