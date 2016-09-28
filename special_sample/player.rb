# coding: utf-8

class Player < Sprite
  def update
    self.x += Input.x * 10
    self.y += Input.y * 10
  end

  
end