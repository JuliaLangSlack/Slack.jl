# Slack

## Usage

Here is a simple exmaple: 
```julia
julia> using Slack

julia> endpoint = "/services/TQVJBU534/BR8C1LMPS/42thawJz34SWSgZCpniyLBSE"
"/services/TQVJBU534/BR8C1LMPS/42thawJz34SWSgZCpniyLBSE"

julia> data = "Hello World"
"Hello World"

julia> response = sendtoslack(data, endpoint)
"ok"
```

To learn more about how data should be formatted before sending it as a argument to the above code, check out the [Slack API Docs](https://api.slack.com/messaging/composing/formatting).

## Testing
I have gone through the trouble of setting up a Slack Workspace in order to test this package. After this is all stabilized, I will remove the endpoint from the Slack Workspace and deprecate the examples you see throughout this repo. 

In the meantime, I cannot stop you from using the end point URL I have setup.  Please use it responsibily. 
