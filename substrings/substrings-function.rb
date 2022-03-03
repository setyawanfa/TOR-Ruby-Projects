dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring(input, dict = dictionary)
  result = Hash.new()

  dict.each do |item|
    result[item] = input.downcase.scan(item).length unless !input.downcase.include?(item)
  end
  return result
end


puts substring("Howdy partner, sit down! How's it going?", dictionary)
