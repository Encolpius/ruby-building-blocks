def caesar(str, number)
  encoded = []
  str.split(' ').each do |x|
    encoded.push(x.gsub(/[A-Za-z]/) { |element| (element.downcase.ord + number) < 123 ?
      (element.ord + number).chr :
      ((element.ord + number) - 122 + 96).to_i.chr})
  end
  return encoded.join(' ')
end
