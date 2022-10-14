CHARS = [*?A..?Z], [*?a..?z]

def caesarCipher(input, shift=5)
  input.tr(CHARS.join, CHARS.map { |ary| ary.rotate shift}.join)
end


puts caesarCipher('What a string!',5)
