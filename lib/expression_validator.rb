class ExpressionValidator


  Index_map = {0 => :mins, 1 => :hours, 2 => :dom, 3 => :month, 4 => :dow}
  Range_max_min = {:mins => {:min => 0, :max => 59}, :hours => {:min => 0, :max => 23}, :dom => {:min => 1, :max => 31}, :month => {:min => 1, :max => 12}, :dow =>{:min => 0, :max => 6}}


  def initialize(expression_string, index)
    @expression_string = expression_string
    @type = Index_map[index]
  end


  def valid_input?()
    !contains_alphabetic_character?(@expression_string) ? true : (raise "The #{@type} expression contains alphabetic characters" )
    if (is_integer?(@expression_string))
      integer_in_range?(@expression_string, @type) ? true : (raise "The #{@type} value is out of range")
    end
    if (contains_hyphen?(@expression_string))
      range_in_range?(@expression_string, @type) ? true : (raise "One of the #{@type} ranges is out of range")
    end
    if (contains_comma?(@expression_string))
      comma_list(@expression_string).each do |value|
        integer_in_range?(value, @type) ? true : (raise "One of the comma seperated values in #{@type} value is out of range")
      end
      return true
    end
    return true

  end


  private

  def is_integer?(string)
    string.to_i.to_s == string
  end

  def integer_in_range?(string, type)
    value = string.to_i
    value >= Range_max_min[type][:min] && value <= Range_max_min[type][:max] ? true : false
  end

  def range_in_range?(string, type)
    string_characters = string.partition('-')
    hyphen_index = string_characters.index('-')
    min = string_characters[hyphen_index - 1].to_i
    max = string_characters[hyphen_index + 1].to_i
    integer_in_range?(min, type) && integer_in_range?(max, type) ? true : false
  end

  def comma_list(string)
    return string.split(',').map{ |number| number.to_i }
  end

  def contains_alphabetic_character?(string)
    string.count("a-zA-Z") > 0 ? true : false
  end

  def contains_hyphen?(string)
    string.include?('-')
  end

  def contains_comma?(string)
    string.include?(',')
  end


end