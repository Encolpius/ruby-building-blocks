def caesar(str, number)
  encoded = []
  until number < 26 do number -= 26 end
  str.split(' ').each do |letter|
    encoded.push(letter.gsub(/[A-Za-z]/) { |element| (element.downcase.ord + number) < 123 ?
      (element.ord + number).chr :
      ((element.ord + number) - 122 + 96).to_i.chr})
  end
  encoded.join(' ')
end
