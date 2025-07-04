require 'string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    # Test case for Step 1: Empty, single number, and two numbers
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number for a single number string" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers separated by a comma" do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    # Test case for Step 2: Any amount of numbers
    it "returns the sum of multiple numbers separated by commas" do
      expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
    end
  end
end
