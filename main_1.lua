 function love.load()
color ={155,99,222}

end
function  love.draw()
love.graphics.setBackgroundColor(color)
end

function love.keypressed()
  color ={math.random(255),math.random(255),math.random(255)}

end
