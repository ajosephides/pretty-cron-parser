require_relative '../../lib/expression_printer.rb'

describe ExpressionPrinter do
  describe '#print' do

    it 'prints correct header for index' do
      evaluatedExpressions = [[0],[1,2,3],[4],[5,6,7],[2],['/some/command']]
      expect{ subject.print(evaluatedExpressions) }.to output("minute        0\nhour          1 2 3\nday of month  4\nmonth         5 6 7\nday of week   2\ncommand       /some/command\n").to_stdout
    end
  end
end
