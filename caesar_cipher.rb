class CaesarCipher

  def create_key(shift, *character_sets)
    key = {}
    character_sets.each do |set|
      key_pairs = set.zip(set.rotate(shift)).to_h
      key = key.merge(key_pairs)
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
