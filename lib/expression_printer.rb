module ExpressionPrinter

  Index_map = {0 => 'minute        ', 1 => 'hour          ', 2 => 'day of month  ', 3 => 'month         ', 4 => 'day of week   ', 5 => 'command       '}

  def self.print(expressions)
    expressions.each_with_index { |array,index| puts "#{Index_map[index]}#{array.join(' ')}\n"}
  end

end