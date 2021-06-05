function listen()
    rednet.open("right")
    local sender, message, protocol = rednet.receive()
    move(message)
end
