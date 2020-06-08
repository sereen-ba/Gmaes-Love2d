 function love.load()
color ={0,99,222}

end
function  love.update(dt)
  function love.keypressed(key, scancode, isrepeat)

 color ={math.random(255),math.random(255),math.random(255)}
 love.event.poll()do
   color ={math.random(255),math.random(255),math.random(255)}
end
end
end

function  love.draw()
love.graphics.setBackgroundColor(color)
end


function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end

end
