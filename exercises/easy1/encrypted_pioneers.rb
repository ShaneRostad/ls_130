ALPHABET = ('a'..'z').to_a

def change_letter(char)
  index = ALPHABET.index(char)

  if index > 12
    new_char = ALPHABET[index - 13]
  else
    new_char = ALPHABET[index + 13]
  end
  new_char
end

def capitalize(output)
  output.join('').split(' ').map(&:capitalize).join(' ')
end

def decypher(name)
  output = []
  name.downcase.chars.each do |char|
    if ALPHABET.include?(char)
      output << change_letter(char)
    else
      output << char
    end
  end

  capitalize(output)
end


p decypher('Nqn Ybirynpr')
p decypher('Tenpr Ubccre')
p decypher('Nqryr Tbyqfgvar')
p decypher('Nyna Ghevat')
p decypher('Wbua Ngnanfbss')
