#!/usr/bin/env ruby

$starting_point = 1 
$target_end_point = 6

while $starting_point < $target_end_point  do
   puts("Inside the loop current_index = #$starting_point" )
   $starting_point +=1
end


(0..5).each do |i|
   puts "Value of local variable is #{i}"
end

