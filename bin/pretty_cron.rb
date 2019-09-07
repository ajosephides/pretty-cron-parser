require_relative '../lib/cron_expression_evaluator.rb'

module PrettyCron

  def self.run(expressionArray, expression_evaluator = CronExpressionEvaluator)
    raise 'There are the wrong number of arguments' unless expressionArray.length == 6
    # correct the splat operator
    expressions = correct_splats(expressionArray)

    # split array so final element is command.
    # loop through each element and comprehend value - return an array of integers
    evaluated_expressions = expressions[0,5].map.with_index do |string, index|
      evaluator = expression_evaluator.new(string, index)
      evaluator.convert_to_integers_array
    end

    # array of integers to be passes to printer
    p evaluated_expressions
    

    
  end




  private

  def self.correct_splats(argv_array)
    filename = caller_locations.first.path
    return argv_array.map{ |string| string == filename ? '*' : string}
  end

end

# PrettyCron.run(ARGV)
