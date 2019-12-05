using Slack
using Test

endpoint = "/services/TQVJBU534/BR8C1LMPS/42thawJz34SWSgZCpniyLBSE"
data = "Hello World"
attachment = Dict("attachments" => [Dict("fallback" => "Required plain-text summary of the attachment",
                                        "color" => "#36a64f",
                                        "pretext" => "Optional text that appears above the attachment block",
                                        "author_name" => "Bobby Tables",
                                        "author_link" => "http://flickr.com/bobby/",
                                        "author_icon" => "http://flickr.com/icons/bobby.jpg",
                                        "title" => "Slack API Documentation",
                                        "title_link" => "https://api.slack.com/",
                                        "text" => "Optional text that appears within the attachment",
                                        "fields" => [Dict("title" => "Priority",
                                            "value" => "High",
                                            "short" => false
                                            )]
                                    )])

response = sendtoslack(data, endpoint)
@test response == "ok"

response2 = sendattachmenttoslack(attachment, endpoint)
@test response2 == "ok"
