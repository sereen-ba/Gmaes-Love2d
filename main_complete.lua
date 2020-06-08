
love.graphics.setDefaultFilter('nearest', 'nearest')

enemy ={}
enemies_controller ={}
enemies_controller.enemies ={}
enemies_controller.image = love.graphics.newImage('images.peg')

function  love.load()
player = {}

player.x=0
player.y=1000
player.speed =5
player.bullets1 ={}
player.cooldown= 20
player.image = love.graphics.newImage('e1.png')
player.fire1= function()
  if player.cooldown <=  0 then
  player.cooldown= 20

  bullets1 ={}
  bullets1.x=player.x+ 200
  bullets1.y=player.y- 100

table.insert( player.bullets1, bullets1)
end
end
enemies_controller:spownEnemy(0,0)
enemies_controller:spownEnemy(500,-500)
enemies_controller:spownEnemy(200,-300)
enemies_controller:spownEnemy(300,-100)
enemies_controller:spownEnemy(20,-1000)
enemies_controller:spownEnemy(500,-200)
enemies_controller:spownEnemy(0,-200)
enemies_controller:spownEnemy(700,-100)
enemies_controller:spownEnemy(1000,0)
enemies_controller:spownEnemy(1350,0)
end

function enemies_controller:spownEnemy(x,y)
  enemy ={}
  enemy.x=x
  enemy.y=y
  enemy.speed =1
  enemy.bullets1 ={}
  enemy.cooldown= 20
  table.insert(self.enemies, enemy)
end

function enemy : fire()
   --enemy.fire(self)
  if self.cooldown <=  0 then

  self.cooldown= 20
  bullets1 ={}
  bullets1.x=self.x+ 35
  bullets1.y=self.y
table.insert( self.bullets1, bullets1)

end
end



function love.update(dt)
  player.cooldown= player.cooldown -1


  if love.keyboard.isDown("right") then
    player.x=player.x+ player.speed
  elseif love.keyboard.isDown("left") then
    player.x=player.x-player.speed
end

if love.keyboard.isDown("up") then
  player.y=player.y-10
elseif love.keyboard.isDown("down") then
  player.y=player.y+10
end

if love.keyboard.isDown("space") then
  player.fire1()
end
for _,e in pairs(enemies_controller.enemies) do
  e.y=e.y+1
end

for i,v in ipairs (player.bullets1) do
  if v.y <-10 then
  table.remove(player.bullets1 ,i)
end
  v.y =v.y -5

end
end

function love.draw()
  love.graphics.scale(0.5)
  love.graphics.setColor(255,255, 255)

  love.graphics.draw(player.image , player.x, player.y)

for _,e in pairs(enemies_controller.enemies) do
  love.graphics.draw(enemies_controller.image, e.x, e.y)

end

-- bullets1
  love.graphics.setColor(255, 255, 255)
for _,v in pairs (player.bullets1) do
  love.graphics.rectangle("fill", v.x, v.y, 7, 7)
end

end
function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end

end
