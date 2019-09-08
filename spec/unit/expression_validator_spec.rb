require_relative '../../lib/expression_validator.rb'


describe ExpressionValidator do
  describe '#valid_input?' do

    it 'raises an error if input integer is greater than type allows - mins' do
      checker = ExpressionValidator.new("100",0)
      expect { checker.valid_input? }.to raise_error(RuntimeError)
    end

    it 'raises an error if input integer is greater than type allows - hours' do
      checker = ExpressionValidator.new("100",1)
      expect { checker.valid_input? }.to raise_error(RuntimeError)
    end

    it 'raises an error if input integer is greater than type allows - dom' do
      checker = ExpressionValidator.new("100",2)
      expect { checker.valid_input? }.to raise_error(RuntimeError)
    end

    it 'raises an error if input integer is greater than type allows - month' do
      checker = ExpressionValidator.new("100",3)
      expect { checker.valid_input? }.to raise_error(RuntimeError)
    end

    it 'raises an error if input integer is greater than type allows - dow' do
      checker = ExpressionValidator.new("100",4)
      expect { checker.valid_input? }.to raise_error(RuntimeError)
    end

    it 'raises an error if input integer is less than type allows - mins' do
      checker = ExpressionValidator.new("-1",0)
      expect { checker.valid_input? }.to raise_error(RuntimeError)
    end

    it 'raises an error if input integer is less than type allows - hour' do
      checker = ExpressionValidator.new("-1",1)
      expect { checker.valid_input? }.to raise_error(RuntimeError)
    end

    it 'raises an error if input integer is less than type allows - dom' do
      checker = ExpressionValidator.new("-1",2)
      expect { checker.valid_input? }.to raise_error(RuntimeError)
    end

    it 'raises an error if input integer is less than type allows - month' do
      checker = ExpressionValidator.new("-1",3)
      expect { checker.valid_input? }.to raise_error(RuntimeError)
    end

    it 'raises an error if input integer is less than type allows - dow' do
      checker = ExpressionValidator.new("-1",4)
      expect { checker.valid_input? }.to raise_error(RuntimeError)
    end

    it 'raises an error if input has any letters in the string' do
      checker = ExpressionValidator.new("sorry", 2)
      expect { checker.valid_input? }.to raise_error(RuntimeError)
    end

    it 'raises an error if the ranges of the hyphen are out of bounds - mins' do
      checker = ExpressionValidator.new("1 - 100", 0)
      expect { checker.valid_input? }.to raise_error(RuntimeError)    
    end

    it 'raises an error if the ranges of the hyphen are out of bounds - hour' do
      checker = ExpressionValidator.new("1 - 100", 1)
      expect { checker.valid_input? }.to raise_error(RuntimeError)    
    end

    it 'raises an error if the ranges of the hyphen are out of bounds - dom' do
      checker = ExpressionValidator.new("1 - 100", 2)
      expect { checker.valid_input? }.to raise_error(RuntimeError)    
    end

    it 'raises an error if the ranges of the hyphen are out of bounds - month' do
      checker = ExpressionValidator.new("1 - 100", 3)
      expect { checker.valid_input? }.to raise_error(RuntimeError)    
    end

    it 'raises an error if the ranges of the hyphen are out of bounds - dow' do
      checker = ExpressionValidator.new("1 - 100", 4)
      expect { checker.valid_input? }.to raise_error(RuntimeError)    
    end

    it 'raises an error if any of the comma separated values are out of bounds - mins' do
      checker = ExpressionValidator.new("1,2,3,4,5,45,100", 0)
      expect { checker.valid_input? }.to raise_error(RuntimeError)  
    end

    it 'raises an error if any of the comma separated values are out of bounds - hours' do
      checker = ExpressionValidator.new("1,2,3,4,5,45,100", 1)
      expect { checker.valid_input? }.to raise_error(RuntimeError)  
    end

    it 'raises an error if any of the comma separated values are out of bounds - dom' do
      checker = ExpressionValidator.new("1,2,3,4,5,45,100", 2)
      expect { checker.valid_input? }.to raise_error(RuntimeError)  
    end

    it 'raises an error if any of the comma separated values are out of bounds - month' do
      checker = ExpressionValidator.new("1,2,3,4,5,45,100", 3)
      expect { checker.valid_input? }.to raise_error(RuntimeError)  
    end

    it 'raises an error if any of the comma separated values are out of bounds - dom' do
      checker = ExpressionValidator.new("1,2,3,4,5,45,100", 4)
      expect { checker.valid_input? }.to raise_error(RuntimeError)  
    end

  end

end