class Triangle

  attr_accessor :x, :y, :z

  def initialize(x, y, z) #upon initialization, accepts three arguments.
    @x = x
    @y = y
    @z = z
  end

  def kind
    validate_triangle #should raise a custom error, TriangleError
      if y == z && z == x
        :equilateral
      elsif x == y || y == z || x == z
        :isosceles
      else
        :scalene
      end
  end

  def sides_greater_than_zero?
    x > 0 && y > 0 && z > 0
  end

  def valid_triangle_inequality?
    x + y > z && x + z > y && y + z > x
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end #raises an error for traingles with no size, triangles with negative sides, or triangles violating trianlge inequality

  class TriangleError < StandardError

  end
end