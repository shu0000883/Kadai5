# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'

#ウィンドウ表示
Window.caption = "Ruby_game_crash"

#追加：カウント
font = Font.new(32)
count=0


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
  enemies << Enemy.new(rand(800), rand(600), enemy_img)
end

Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  #追加：背景表示
  Window.draw(0, 0, bg_img)

  Window.draw_font(0, 0, "score:#{count}", font) 

  Sprite.update(enemies)
  Sprite.draw(enemies)

  player.update
  player.draw

  # 当たり判定
  #追加：カウント
  if Sprite.check(player, enemies) 
    count+=1
  end
end