# Incubyte_TDD_assessment
String Calculator followed by TDD Development

A simple Ruby project using TDD to build a string calculator.

## Features

- Add method to handle any amount of numbers separated by commas
- Add method to handle new lines between numbers (instead of commas)
- Support different delimiters
    - Custom delimiters like: (`//;\n1;2`)
- Negative number not allowed
- Numbers bigger than 1000 should be ignored
- Delimiters can be of any length
- Allow multiple delimiters

## How to Run
- Terminal commands
    - bundle install
    - rspec
    - rspec spec/string_calculator_spec.rb
