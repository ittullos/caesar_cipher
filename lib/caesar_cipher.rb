LOWER_CASE = ('a'..'z').to_a
UPPER_CASE = ('A'..'Z').to_a
NUMERICAL = ('0'..'9').to_a

class CaesarCipher

  def solve(message, shift)
    key = key(shift,LOWER_CASE,UPPER_CASE,NUMERICAL)
    solution(key, message)
  end

  private

  def key(shift, *character_sets)
    key = {}
    character_sets.each do |set|
      key_pairs = set.zip(set.rotate(shift)).to_h
      key = key.merge(key_pairs)
    end
  key
  end

  def solution(key, message)
    message.chars.map {|char| key.fetch(char, char)}.join
  end
end
