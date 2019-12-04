using Slack
using Test

endpoint = "/services/TQVJBU534/BR8C1LMPS/42thawJz34SWSgZCpniyLBSE"
data = "Hello World"

response = sendtoslack(data, endpoint)
@test response == "ok"
