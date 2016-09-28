# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'

#ウィンドウ表示
Window.caption = "Ruby_game_crash"

#追加：カウント
font = Font.new(32)
count=0

#追加：敵を出現させる
tm = 0

#追加：時間を表示
time=0

Window.width  = 800
Window.height = 600

#追加：背景表示
bg_img = Image.load("earth.png")


player_img = Image.load("player.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

player = Player.new(400, 500, player_img)

enemies = []
10.times do
  enemies << Enemy.new(rand(800), rand(200), enemy_img)
end

Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  #追加：背景表示
  Window.draw(0, 0, bg_img)

  #追加：scoreカウント
  Window.draw_font(0, 0, "score:#{count}", font) 

  Sprite.update(enemies)
  Sprite.draw(enemies)
  
  #追加：敵を出現させる
  tm = tm + 1
  if tm%30 == 0
    enemies << Enemy.new(rand(800), rand(200), enemy_img)
    puts tm
  end

  #追加：時間を表示
  Window.draw_font(700, 0, "time:#{time}", font)
  if tm%60 == 0
    time += 1
  end

  player.update
  player.draw

  # 当たり判定
  #追加：scoreカウント
  if Sprite.check(player, enemies) 
    count+=1
  end
  
end