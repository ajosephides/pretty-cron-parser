#!/usr/bin/env ruby

require_relative '../lib/cron_expression_evaluator.rb'
require_relative '../lib/expression_printer.rb'
require_relative '../lib/expression_validator.rb'


module PrettyCron

  def self.run(expressionArray, expression_validator = ExpressionValidator, expression_evaluator = CronExpressionEvaluator, expression_printer = ExpressionPrinter)
    raise 'There are the wrong number of arguments' unless expressionArray.length == 6
    # correct the splat operator
    expressions = correct_splats(expressionArray)

    # split array so final element is command.
    # loop through each element and comprehend value - return an array of integers
    evaluated_expressions = expressions[0,5].map.with_index do |string, index|
      validate_expression = expression_validator.new(string, index)
      if validate_expression.valid_input?
        evaluator = expression_evaluator.new(string, index)
        evaluator.convert_to_integers_array
      end
    end

    evaluated_expressions_and_command = evaluated_expressions.push([expressions[5]])
    # array of integers to be passes to printer
    expression_printer.print(evaluated_expressions_and_command)
  end

  private

  def self.correct_splats(argv_array)
    #had to hardcode filename as changed when using shebang
    #filename = caller_locations.first.path  
    filename = 'pretty_cron.rb'
    return argv_array.map{ |string| string == filename ? '*' : string}
  end

end

ENV['PR_CRON_ENV'] == 'test' ? nil : PrettyCron.run(ARGV)
