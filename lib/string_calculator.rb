class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = /,|\n/

    if numbers.start_with?("//")
      delimiter_section, numbers = numbers.split("\n", 2)

      delimiter = Regexp.escape(delimiter_section[2])
    end

    numbers       = numbers.split(/#{delimiter}/).map(&:to_i)
    valid_numbers = numbers.reject { |num| num > 1000 }

    raise_for_negatives!(valid_numbers)

    valid_numbers.sum
  end

  private

  def self.raise_for_negatives!(numbers)
    negatives = numbers.select { |n| n.negative? }

    return if negatives.empty?

    raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}"
  end
end
