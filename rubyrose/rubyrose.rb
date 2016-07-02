require 'gosu'

class GameWindow < Gosu::Window
  SIZE = 500
  ORIGIN = SIZE/2
  TIMES_DELTA = 20
  SCALE = 150
  ROSE_K = 5.0/3.0
  DEL_THETA = Math::PI/180/4

  def initialize
    super SIZE, SIZE
    self.caption = "Rose"

    @k = ROSE_K
    @times = 1
  end

  def update
  end

  def draw
    draw_rose(ORIGIN, @k)
  end

  private
  def draw_point(x, y, color=0xffffffff)
    draw_quad(x, y, color, x+1, y, color, x, y+1, color, x+1, y+1, color, 0)
  end

  def draw_rose(origin, k)
    @times.times do |i|
      theta = i * DEL_THETA
      x = Math.cos(k*theta)*Math.cos(theta) * SCALE
      y = Math.cos(k*theta)*Math.sin(theta) * SCALE
      draw_point(origin+x, origin+y)
    end

    @times += TIMES_DELTA
  end
end

window = GameWindow.new
window.show
