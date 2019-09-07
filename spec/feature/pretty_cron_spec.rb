require_relative '../../bin/pretty_cron.rb'

describe PrettyCron do
  xit 'parses a cron expression correctly and prints it to stdout in a human readable format' do
    expect(subject.pretty_cron(['*/15', '0', '1,15', '*', '1-5', '/usr/bin/find'])).to output("
      minute        0 15 30 45\n
      hour          0\n
      day of month  1 15\n
      month         1 2 3 4 5 6 7 8 9 10 11 12\n
      day of week   1 2 3 4 5\n
      command       /usr/bin/find").to_stdout
  end
end