class CronExpressionEvaluator

  attr_reader :type

  Index_map = {0 => :mins, 1 => :hours, 2 => :dom, 3 => :month, 4 => :dow}

  def initialize(expression_string, index)
    @expression_string = expression_string
    @type = Index_map[index]
  end





end