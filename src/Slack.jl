module Slack

using HTTP
using JSON

include("send.jl")
export
    sendtoslack,
    sendattachmenttoslack

end # module
