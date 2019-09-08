require_relative '../../bin/pretty_cron.rb'

describe PrettyCron do
  it 'throws and error when input string is invalid' do
    expect{ subject.run(['*/15', '0', '1,15', 'hello', '1-5', '/usr/bin/find'])}.to raise_error(RuntimeError)
  end
end