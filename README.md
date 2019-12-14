# Slack
_Note that this repo is a WIP._

## Setup

The first thing you will need to use this package is a [Slack Workspace](https://slack.com/create) to [install a Slack app into](https://api.slack.com/start).

After that, you will need to add a `webhook` to your app such that you can send and retrieve data from the Slack Workspace.

## Install

```julia
julia> ]
(v1.3) pkg> add Slack
```

## Usage

Here is a simple example:
```julia
julia> using Slack

julia> endpoint = "/services/TQVJBU534/BR8C1LMPS/42thawJz34SWSgZCpniyLBSE"
"/services/TQVJBU534/BR8C1LMPS/42thawJz34SWSgZCpniyLBSE"

julia> data = "Hello World"
"Hello World"

julia> response = sendtoslack(data, endpoint)
"ok"
```
The result of running this code produces the following in the test Slack Workspace:

![logo](assets/readme.png)

To learn more about how data should be formatted before sending it as a argument to the above code, check out the [Slack API Docs](https://api.slack.com/messaging/composing/formatting).

You can also check your messages format using [Slacks Message Formatting Tool](https://api.slack.com/docs/messages/builder?msg=%7B%22text%22%3A%20%22This%20is%20a%20line%20of%20text.%5CnAnd%20this%20is%20another%20one.%22%7D).


And here is a more complicated example using attachments:

```julia
julia> using Slack

julia> endpoint = "/services/TQVJBU534/BR8C1LMPS/42thawJz34SWSgZCpniyLBSE"
"/services/TQVJBU534/BR8C1LMPS/42thawJz34SWSgZCpniyLBSE"

julia> attachment = Dict("attachments" => [Dict("fallback" => "Required plain-text summary of the attachment",
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
Dict{String,Array{Dict{String,Any},1}} with 1 entry:
  "attachments" => Dict{String,Any}[Dict("author_link"=>"http://flickr.com/bob"


julia> response = sendattachmenttoslack(attachment, endpoint)
"ok"

```

The result of running this code produces the following in the test Slack Workspace:

![logo](assets/readme2.png)

## Testing
I have gone through the trouble of setting up a Slack Workspace in order to test this package. After this is all stabilized, I will remove the endpoint from the Slack Workspace and deprecate the examples you see throughout this repo.

In the meantime, I cannot stop you from using the end point URL I have setup.  Please use it responsibly.
