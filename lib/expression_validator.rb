class ExpressionValidator


  Index_map = {0 => :mins, 1 => :hours, 2 => :dom, 3 => :month, 4 => :dow}
  Range_max_min = {:mins => {:min => 0, :max => 59}, :hours => {:min => 0, :max => 23}, :dom => {:min => 1, :max => 31}, :month => {:min => 1, :max => 12}, :dow =>{:min => 0, :max => 6}}


  def initialize(expression_string, index)
    @expression_string = expression_string
    @type = Index_map[index]
  end


  def valid_input?()
    if (is_integer?(@expression_string))
      integer_in_range?(@expression_string, @type) ? true : (raise "Your #{@type} value is out of range")
    end
  end


  private

  def is_integer?(string)
    string.to_i.to_s == string
  end

  def integer_in_range?(string, type)
    value = string.to_i
    if (value >= Range_max_min[type][:min] && value <= Range_max_min[type][:max])
      return true
    else
      return false
    end
  end
end