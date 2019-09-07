module PrettyCron

  def self.run(expressionArray)
    raise 'There are the wrong number of arguments' unless expressionArray.length == 6
    puts expressionArray
  end

  run(ARGV)

end