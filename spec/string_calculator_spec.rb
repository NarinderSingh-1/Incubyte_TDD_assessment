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

    # Test case for Step 3: Handle new lines
    it "returns the sum of numbers separated by new lines and commas" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "returns the sum of numbers separated by multiple new lines" do
      expect(StringCalculator.add("1\n2\n3")).to eq(6)
    end

    # Test case for Step 4: Custom delimiters
    it "returns the sum of numbers with a custom single-character delimiter" do
      expect(StringCalculator.add("//;\n1;2;3")).to eq(6)
    end

    # Test case for Step 5: Handle Negative numbers
    it "throws an exception for a single negative number" do
      expect { StringCalculator.add("-1") }.to raise_error(ArgumentError, "Negative numbers not allowed: -1")
    end

    it "throws an exception for multiple negative numbers" do
      expect { StringCalculator.add("1,-2,3,-4") }.to raise_error(ArgumentError, "Negative numbers not allowed: -2, -4")
    end

    it "throws an exception for negative numbers with custom delimiter" do
      expect { StringCalculator.add("//;\n-1;2;-3") }.to raise_error(ArgumentError, "Negative numbers not allowed: -1, -3")
    end

    # Test case for Step 6: Ignore numbers greater than 1000
    it "ignores numbers greater than 1000" do
      expect(StringCalculator.add("2,1001")).to eq(2)
    end

    it "ignores multiple numbers greater than 1000" do
      expect(StringCalculator.add("10,2000,5,3000")).to eq(15)
    end

    it "handles numbers greater than 1000 with custom delimiter" do
      expect(StringCalculator.add("//;\n10;2000;5;3000")).to eq(15)
    end

    it "does not ignore 1000 itself" do
      expect(StringCalculator.add("1000,5")).to eq(1005)
    end
  end
end
