function move(message)
    if (message == "left")
    then
        turtle.turnLeft()
    elseif (message == "right")
    then
        turtle.turnRight()
    elseif (message == "forward")
    then
        turtle.forward()
    end
end