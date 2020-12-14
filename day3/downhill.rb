#!/usr/bin/env ruby

input = File.readlines('input.txt').map(&:chomp)

def check_slope(input, run_step, rise_step)
  biome_width = input[0].length

  run = 0
  trees_hit = 0

  input.each_with_index do |terrain, i|
    if i % rise_step == 0
      if terrain[run] == '#'
        trees_hit += 1
      end
    
      run += run_step
      run = run % biome_width
    end
  end

  return trees_hit
end

def multiply_slopes(input, run_rise_pairs)
  slopes = []

  run_rise_pairs.each do |run_rise|
    slopes.push(check_slope(input, run_rise[0], run_rise[1]))
  end

  slopes.inject(:*)
end

puts "For right 3, down 1: #{check_slope(input, 3, 1)} trees"
puts "Multiplying slopes together: #{multiply_slopes(input, [[1,1],[3,1],[5,1],[7,1],[1,2]])}"
