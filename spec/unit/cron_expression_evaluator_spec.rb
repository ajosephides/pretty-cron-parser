require_relative '../../lib/cron_expression_evaluator.rb'

describe CronExpressionEvaluator do
  describe '#intialize' do
    it 'correctly maps type of expression min, hour, day week...' do
      cron_eval = CronExpressionEvaluator.new('*', 0)
      expect(cron_eval.type).to eq(:mins)
    end
  end


  describe '#convertToIntegersArray' do
    it 'returns the correct range for a single "*" expression - minutes' do
      cron_eval = CronExpressionEvaluator.new('*', 0)
      expect(cron_eval.convert_to_integers_array).to eq((0..59).to_a)
    end

    it 'returns the correct range for a single "*" expression - hours' do
      cron_eval = CronExpressionEvaluator.new('*', 1)
      expect(cron_eval.convert_to_integers_array).to eq((0..23).to_a)
    end

    it 'returns the correct range for a single "*" expression - day of month' do
      cron_eval = CronExpressionEvaluator.new('*', 2)
      expect(cron_eval.convert_to_integers_array).to eq((1..31).to_a)
    end

    it 'returns the correct range for a single "*" expression - month' do
      cron_eval = CronExpressionEvaluator.new('*', 3)
      expect(cron_eval.convert_to_integers_array).to eq((1..12).to_a)
    end

    it 'returns the correct range for a single "*" expression - day of week' do
      cron_eval = CronExpressionEvaluator.new('*', 4)
      expect(cron_eval.convert_to_integers_array).to eq((0..6).to_a)
    end

    it 'returns the number if a single digit is the expression' do
      cron_eval = CronExpressionEvaluator.new('5', 2)
      expect(cron_eval.convert_to_integers_array).to eq([5])
    end

    it 'returns a range if expression has a hypen' do
      cron_eval = CronExpressionEvaluator.new('1-10', 0)
      expect(cron_eval.convert_to_integers_array).to eq((1..10).to_a)
    end

    it 'returns a list of values seperated by ","' do
      cron_eval = CronExpressionEvaluator.new('1,4,5,8,10', 1)
      expect(cron_eval.convert_to_integers_array).to eq([1,4,5,8,10])
    end

    it 'returns a list of intervals for a "/" operator if used with "*" operator' do
      cron_eval = CronExpressionEvaluator.new('*/10', 0)
      expect(cron_eval.convert_to_integers_array).to eq([0,10,20,30,40,50])
    end

  end






end