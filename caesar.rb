def caesar_cipher(str, number)
  encoded = []
  until number < 26 do number -= 26 end
  str.split(' ').each do |letter|
    encoded.push(letter.gsub(/[A-Za-z]/) { |element| (element.downcase.ord + number) < 123 ?
      (element.ord + number).chr :
      ((element.ord + number) - 122 + 96).to_i.chr})
  end
  encoded.join(' ')
end

puts "Please enter a phrase:"
str = gets.chomp
puts "Now, how far would you like to shift?"
number = gets.chomp.to_i
puts "The encoded phrase is #{caesar_cipher(str, number)}"
