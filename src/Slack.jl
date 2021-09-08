module Slack

using HTTP
using CodecZlib
using JSON

# Message object in the threaded form
mutable struct threadedMessage
    edited::Bool
    ts::String
    thread_ts::String
    user::String
    text::String
end

# A thread is an array of threadMessage's
mutable struct thread
    thread::Array{threadedMessage}
end

mutable struct message
    edited::Bool
    ts::String
    user::String
    text::String
end

include("send.jl")
export
    sendtoslack,
    sendattachmenttoslack,
    sendfiletoslack

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
