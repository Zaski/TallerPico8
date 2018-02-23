pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
score=0
-- paddle
padx=52
pady=122
padw=24
padh=4

-- ball
ballx=64
bally=64
ballsize=3
ballxdir=5
ballydir=-3

function movepaddle()
  if btn (0) then
    padx-=3
  elseif btn(1) then
    padx+=3 end
end

function moveball()
  ballx+=ballxdir
  bally+=ballydir
end

function losedeadball()
  if bally>128 then
    sfx(3)
    bally=24
  end
end

function bounceball()
  -- left
  if ballx < ballsize then
    ballxdir=-ballxdir
    sfx(0)
  end
  -- right
  if ballx > 128-ballsize then
    ballxdir=-ballxdir
    sfx(0)
  end
  -- top
  if bally < ballsize then
    ballydir=-ballydir
  sfx(0)
  end
end

-- bounce the ball off the paddle
function bouncepaddle()
  if ballx>=padx and ballx<=padx+padw and bally>pady then
    sfx(0)
    score+=10 -- increase the score on a hit!
    ballydir=-ballydir
  end
end

function _update()
  movepaddle()
  bounceball()
  bouncepaddle()
  moveball()
  losedeadball()
end

function _draw()
  -- clear the screen
  rectfill(0,0, 128,128, 3)

  -- draw the score
  print(score, 12, 6, 15)

  -- draw the paddle
  rectfill(padx, pady, padx+padw, pady+padh, 15)

  -- draw the ball
  circfill(ballx,bally,ballsize,15)
end
__sfx__
000400003705000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000600002b0501f050140500d05009050070500705000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
