module Slack

using HTTP
using CodecZlib
using JSON

include("send.jl")
export
    sendtoslack,
    sendattachmenttoslack

include("channel.jl")
export
    getchannels

# include("utils.jl")
# export
#     convert_HTTP_Response_To_JSON

end # module
