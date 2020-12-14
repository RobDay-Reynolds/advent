#!/usr/bin/env ruby

input = File.readlines('input.txt').map(&:chomp)

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
            puts number * second_number * third_number

            return
          end
        end
      end
    end
  end
end
