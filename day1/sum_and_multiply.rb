#!/usr/bin/env ruby

input = File.readlines('input.txt').map(&:chomp)

def multiply_two_numbers(input)
  input.each do |number|
    number = number.to_i
    if number < 2020
      input.each do |second_number|
        second_number = second_number.to_i
  
        if number + second_number == 2020
          return number * second_number
        end
      end
    end
  end
end

def multiply_three_numbers(input)
  input.each do |number|
    number = number.to_i
    if number < 2020
      input.each do |second_number|
        second_number = second_number.to_i
        sum = number + second_number
        if sum < 2020
          input.each do |third_number|
            third_number = third_number.to_i
  
            if sum + third_number == 2020
              return number * second_number * third_number
            end
          end
        end
      end
    end
  end
end

puts "With two numbers: #{multiply_two_numbers(input)}"
puts "With three numbers: #{multiply_three_numbers(input)}"
