require './lib/calculator'

describe Calculator do
  describe "#add" do
    it "return the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql (7)
    end

    it "return the sume of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe "#multipy" do
    it "return multiplication of two number" do
      calculator = Calculator.new
      expect(calculator.multiply(1,2)).to eql(2)
    end

    it "return multiplication to zero" do
      calculator = Calculator.new
      expect(calculator.multiply(2,0)).to eql(0)
    end

    it "return multiplication of three number" do
      calculator = Calculator.new
      expect(calculator.multiply(3,2,9)).to eql(54)
    end
  end

  describe "#subtract" do
    it "return subtraction of two number" do
      calculator = Calculator.new
      expect(calculator.subtract(3,2)).to eql(1)
    end

    it "return subtract with result less than 0" do
      calculator = Calculator.new
      expect(calculator.subtract(1,4)).to eql(-3)
    end

    it "return subtract with input number if only one input given" do
      calculator = Calculator.new
      expect(calculator.subtract(2)).to eql(2)
    end
  end

  describe "#divide" do
    it "return division of two number" do
      calculator = Calculator.new
      expect(calculator.divide(4,2)).to eql(2)
    end

    it "return division of zero" do
      calculator = Calculator.new
      expect(calculator.divide(1,0)).to eql('cannot divide by zero')
    end
  end
end
