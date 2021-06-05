SLOT_NUM = 16

function refillFuel()
    limit = turtle.getFuelLimit()
    currentLevel = turtle.getFuelLevel()

    if((currentLevel/limit) < 0.2)
    then
        --Take fuel from chest
        turtle.suck()

        for i = 1, SLOT_NUM, 1
        do
            turtle.select(i)
            if(turtle.refuel(0))
            then
                count = turtle.getItemCount()
                turtle.refuel(count)
            end
        end

        --Reset the selected slot
        turtle.select(1)
    end
end

function moveTurtle()
    turtle.turnLeft()
    if(turtle.detect())
    then
        turtle.turnRight()
        turtle.turnRight()        
        while(not turtle.detect())
        do
            turtle.forward()
        end
        refillFuel()
        turtle.turnLeft()
    else
        turtle.forward()
        turtle.turnRight()
    end
end

function getItemIndex(itemName)
    for slot = 1, SLOT_NUM, 1
    do
        local item = turtle.getItemDetail(i)
        if(item ~= nil)
        then           
            if(turtle.getItemDetail()['name'] == itemName)
            then
                return slot
            end
        end
    end
end

function harvest()
    turtle.dig()
    turtle.suck()
    potatoIndex = getItemIndex("minecraft:potato")
    if(potatoIndex)
    then
        turtle.select(potatoIndex)
        turtle.place()
        potatoCount = turtle.getItemCount()
        turtle.dropDown(potatoCount)
    else
        print("Potato not found!")
    end
end

function checkCrop()
    isBlock, data = turtle.inspect()

    if (not isBlock)
    then
        print("There is no crop in front of the turtle!!")
    else
        if (data['state']['age'] == 7)
        then
            harvest()
            moveTurtle()
        end
    end
end

function start()
    print("Program is running...")
    while(1)
    do
        checkCrop()
    end
end

start()