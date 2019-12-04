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
_Note that this will not work till the package is registered._

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

In the meantime, I cannot stop you from using the end point URL I have setup.  Please use it responsibly.
