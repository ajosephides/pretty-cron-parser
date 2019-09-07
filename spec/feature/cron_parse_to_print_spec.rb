require_relative '../../bin/pretty_cron.rb'

describe PrettyCron do
  it 'parses a cron expression correctly and prints it to stdout in a human readable format' do
    expect{ subject.run(['*/15', '0', '1,15', '*', '1-5', '/usr/bin/find'])}.to output("minute        0 15 30 45\nhour          0\nday of month  1 15\nmonth         1 2 3 4 5 6 7 8 9 10 11 12\nday of week   1 2 3 4 5\ncommand       /usr/bin/find\n").to_stdout
  end
end