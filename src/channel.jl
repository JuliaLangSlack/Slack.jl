using Slack

mutable struct channel
    is_private::Bool
    pending_connected_team_ids
    topic
    is_archived::Bool
    is_general::Bool
    is_mpim::Bool
    name
    previous_names
    num_members::Int64
    is_im::Bool
    id
    created::Int64
    name_normalized
    is_group::Bool
    purpose
    creator
    is_channel::Bool
    pending_shared
    is_shared::Bool
    is_ext_shared::Bool
    shared_team_ids
    is_member::Bool
    parent_conversation
    is_pending_ext_shared::Bool
    is_org_shared::Bool

end


"""
    getchannels(token::String)
"""
function getchannels(token::String)

    HTTP.setuseragent!("HTTP.jl")

    url = "https://slack.com/api/conversations.list?token=$(token)"

    r = HTTP.get(url, ["Content-Type" => "application/json"])

    json_obj = JSON.parse(String(r.body))
    channel_holder = []

    for (k,v) in json_obj
        if occursin("channels", k)
            for item in v

                is_private = false
                pending_connected_team_ids = []
                topic = []
                is_archived = false
                is_general = false
                is_mpim = false
                name = ""
                previous_names = []
                num_members = 0
                is_im = false
                id = ""
                created = 0
                name_normalized = ""
                is_group = false
                purpose = []
                creator = ""
                is_channel = false
                pending_shared = []
                is_shared = false
                is_ext_shared = false
                shared_team_ids = []
                is_member = false
                parent_conversation = []
                is_pending_ext_shared = false
                is_org_shared = false

                for (key,value) in item
                    if occursin("is_private", key)
                        is_private = value
                    elseif occursin("pending_connected_team_ids", key)
                        pending_connected_team_ids = value
                    elseif occursin("topic", key)
                        topic = value
                    elseif occursin("is_archived", key)
                        is_archived = value
                    elseif occursin("is_general", key)
                        is_general = value
                    elseif occursin("is_mpim", key)
                        is_mpim = value
                    elseif occursin("name", key)
                        name = value
                    elseif occursin("previous_names", key)
                        previous_names = value
                    elseif occursin("num_members", key)
                        num_members = value
                    elseif occursin("is_im", key)
                        is_im = value
                    elseif occursin("id", key)
                        id = value
                    elseif occursin("created", key)
                        created = value
                    elseif occursin("name_normalized", key)
                        name_normalized = value
                    elseif occursin("is_group", key)
                        is_group = value
                    elseif occursin("purpose", key)
                        purpose = value
                    elseif occursin("creator", key)
                        creator = value
                    elseif occursin("is_channel", key)
                        is_channel = value
                    elseif occursin("pending_shared", key)
                        pending_shared = value
                    elseif occursin("is_shared", key)
                        is_shared = value
                    elseif occursin("is_ext_shared", key)
                        is_ext_shared = value
                    elseif occursin("shared_team_ids", key)
                        shared_team_ids = value
                    elseif occursin("is_member", key)
                        is_member = value
                    elseif occursin("parent_conversation", key)
                        parent_conversation = value
                    elseif occursin("is_pending_ext_shared", key)
                        is_pending_ext_shared = value
                    elseif occursin("is_org_shared", key)
                        is_org_shared = value
                    end
                    # println("$(key) $(value)") #DEBUG
                end
                new_channel = channel(is_private, pending_connected_team_ids, topic, is_archived, is_general,
                is_mpim, name, previous_names, num_members, is_im, id[1], created, name_normalized,
                is_group, purpose, creator, is_channel, pending_shared, is_shared, is_ext_shared,
                shared_team_ids, is_member, parent_conversation, is_pending_ext_shared, is_org_shared)

                push!(channel_holder, new_channel)
            end
        end
    end

    return (channel_holder)

end
