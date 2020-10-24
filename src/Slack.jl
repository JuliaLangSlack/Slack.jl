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

include("history.jl")
export
    getchannelhistory

include("threads.jl")
export
    getthreads

end # module
