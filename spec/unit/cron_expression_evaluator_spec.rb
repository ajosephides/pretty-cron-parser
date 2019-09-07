require_relative '../../lib/cron_expression_evaluator.rb'

describe CronExpressionEvaluator do
  describe '#intialize' do
    it 'correctly maps type of expression min, hour, day week...' do
      cron_eval = CronExpressionEvaluator.new('*', 0)
      expect(cron_eval.type).to eq(:mins)
    end
  end


  describe '#convertToIntegersArray' do
    it 'returns the correct range for a single "*" expression - seconds' do
      cron_eval = CronExpressionEvaluator.new('*', 0)
      expect(cron_eval.convert_to_integers_array).to eq((0..59).to_a)
    end

  end






end