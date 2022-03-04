def stock_picker(input)
  [input.index(input.combination(2).max_by{|buy, sell| sell - buy }[1]),input.index(input.combination(2).max_by{|buy, sell| sell - buy }[0])]
end

stock_picker([17,3,6,9,15,8,6,1,10])
