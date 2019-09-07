class CronExpressionEvaluator

  attr_reader :type

  Index_map = {0 => :mins, 1 => :hours, 2 => :dom, 3 => :month, 4 => :dow}
  Range_max_min = {:mins => {:min => 0, :max => 59}, :hours => {:min => 0, :max => 23}, :dom => {:min => 1, :max => 31}, :month => {:min => 1, :max => 12}, :dow =>{:min => 0, :max => 6}}

  def initialize(expression_string, index)
    @expression_string = expression_string
    @type = Index_map[index]
  end

  def convert_to_integers_array()
    return range_lookup if (@expression_string == '*')
  end

  private
  
  def range_lookup
    min = Range_max_min[@type][:min]
    max = Range_max_min[@type][:max]
    return (min..max).to_a
  end




end