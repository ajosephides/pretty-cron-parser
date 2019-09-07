require_relative '../../lib/cron_expression_evaluator.rb'

describe CronExpressionEvaluator do
  describe '#intialize' do
    it 'correctly maps type of expression min, hour, day week...' do
      cron_eval = CronExpressionEvaluator.new('*', 0)
      expect(cron_eval.type).to eq(:mins)
    end
  end






end