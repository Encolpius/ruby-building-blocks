class Dictionary
  def initialize
    @dictionary_substrings = Hash.new(0)
  end

  def substrings(str)
    dictionary_words = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    str.downcase.split(' ').each do |word|
      dictionary_words.each do |x|
        if word.include?(x)
          @dictionary_substrings[x] += 1
        end
      end
    end
    puts @dictionary_substrings
  end
end

dictionary = Dictionary.new
puts "Type in a phrase!"
str = gets.chomp
dictionary.substrings(str)
