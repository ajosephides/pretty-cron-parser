require_relative '../../bin/pretty_cron.rb'

describe PrettyCron do
  describe '#run' do
    it 'throws an error if the args are too few (less than 6)' do
    expect { subject.run(['*', '*', '*', '*', './do/something']) }.to raise_error(RuntimeError)
    end

    it 'throws an error if the args are too many (greater than 6)' do
      expect { subject.run(['*', '*', '*', '*', '*', '*', './do/something']) }.to raise_error(RuntimeError)
    end
  end
end