class CaesarCipher

  def create_key(shift, *character_sets)
    key = {}
    character_sets.each do |set|
      key_pairs = set.zip(set.rotate(shift))
      key_pairs_hash = key_pairs.to_h
      key = key.merge(key_pairs_hash)
    end
  key
  end

  def find_solution(key, message)
    solution = message.chars.map { |char| key.fetch(char, char) }
    solution.join
  end

  def solve(message, shift)
    lower_case = ('a'..'z').to_a
    upper_case = ('A'..'Z').to_a
    numerical = ('0'..'9').to_a
    key = create_key(shift, lower_case, upper_case, numerical)
    find_solution(key, message)
  end
end

cipher = CaesarCipher.new
encrypted = cipher.solve('The Barbarians are attacking tomorrow, 11/3', 2)
puts "  -> Encrypted Message: #{encrypted}"
original = cipher.solve(encrypted, -2)
puts "  -> Original Message: #{original}"
