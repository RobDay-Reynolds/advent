#!/usr/bin/env ruby

input = File.readlines('input.txt').map(&:chomp)

def split_record(password_record)
  components = password_record.split(' ')
  counts = components[0].split('-')

  first_num = counts[0].to_i
  second_num = counts[1].to_i

  key_letter = components[1].split(':')[0]
  password = components[2]

  return {
    first_num: first_num,
    second_num: second_num,
    key_letter: key_letter,
    password: password,
  }
end

def password_count_valid(password_record)
  parsed_record = split_record(password_record)

  character_count = parsed_record[:password].count(parsed_record[:key_letter])
  character_count >= parsed_record[:first_num] && character_count <= parsed_record[:second_num]
end

def password_positionally_valid(password_record)
  parsed_record = split_record(password_record)

  (parsed_record[:password][parsed_record[:first_num] - 1] == parsed_record[:key_letter]) ^
    (parsed_record[:password][parsed_record[:second_num] - 1] == parsed_record[:key_letter])
end

count_valid_passwords = 0
positionally_valid_passwords = 0

input.each do |entry|
  if password_count_valid(entry)
    count_valid_passwords += 1
  end
  if password_positionally_valid(entry)
    positionally_valid_passwords += 1
  end
end

puts "By count: #{count_valid_passwords}"
puts "By position: #{positionally_valid_passwords}"
