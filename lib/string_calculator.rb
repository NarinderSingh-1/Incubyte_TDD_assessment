class StringCalculator
  MAX_NUMBER = 1000

  def self.add(numbers)
    return 0 if numbers.strip.empty?

    parsed_numbers = parse_numbers(numbers)

    raise_for_negatives!(parsed_numbers)
    sum_of_valid_numbers(parsed_numbers)
  end

  private

  def self.parse_numbers(numbers)
    delimiter_regex = /,|\n/

    if numbers.start_with?("//")
      delimiter_section, numbers = numbers.split("\n", 2)
      delimiters                 = extract_delimiters(delimiter_section)
      delimiter_regex            = Regexp.union(delimiters)
    end

    numbers.split(delimiter_regex).map(&:to_i)
  end

  def self.extract_delimiters(delimiter_section)
    if delimiter_section.start_with?("//[")
      delimiter_section.scan(/\[(.+?)\]/).flatten
    else
      [delimiter_section[2]]
    end
  end

  def self.raise_for_negatives!(numbers)
    negatives = numbers.select { |n| n.negative? }

    return if negatives.empty?

    raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}"
  end

  def self.sum_of_valid_numbers(numbers)
    numbers.select { |n| n <= MAX_NUMBER }.sum
  end
end
