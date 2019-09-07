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
    return [@expression_string.to_i] if (is_integer?(@expression_string))
    return hyphen_range(@expression_string) if (contains_hyphen?(@expression_string))
    return comma_list(@expression_string) if (contains_comma?(@expression_string))

  end

  private
  
  def range_lookup
    min = Range_max_min[@type][:min]
    max = Range_max_min[@type][:max]
    return (min..max).to_a
  end

  def hyphen_range(string)
    string_characters = string.partition('-')
    hypen_index = string_characters.index('-')
    min = string_characters[hypen_index - 1].to_i
    max = string_characters[hypen_index + 1].to_i
    return (min..max).to_a
  end

  def comma_list(string)
    return string.split(',').map{ |number| number.to_i }
  end

  def is_integer?(string)
    string.to_i.to_s == string
  end

  def contains_hyphen?(string)
    string.include?('-')
  end

  def contains_comma?(string)
    string.include?(',')
  end

end