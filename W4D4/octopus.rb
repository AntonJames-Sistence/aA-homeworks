arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
 'fiiiissshhhhhh']

 def very_hungry_octopus(arr)
    longest = ''
    arr.each do |fish|
        longest = fish if longest.length < fish.length
    end
    longest
 end

p very_hungry_octopus(arr)