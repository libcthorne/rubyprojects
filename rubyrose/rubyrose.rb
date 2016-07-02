require 'gosu'

class GameWindow < Gosu::Window
  SIZE = 500
  ORIGIN = SIZE/2
  TIMES_DELTA = 5
  SCALE = 50
  ROSE_K = 4.0/9
  DEL_THETA = Math::PI/180/2

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
    draw_rose(ORIGIN*3.0/2, @k/8)
    draw_rose(ORIGIN*1.0/2, @k*2)
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
