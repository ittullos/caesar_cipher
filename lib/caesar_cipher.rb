LOWER_CASE = ('a'..'z').to_a
UPPER_CASE = ('A'..'Z').to_a
NUMERICAL = ('0'..'9').to_a

class CaesarCipher

  def solve(message, shift)
    solution(key(shift), message)
  end

  private

  def key(shift)
    [LOWER_CASE,UPPER_CASE,NUMERICAL].reduce({}) do |key, set|
      key_pairs = set.zip(set.rotate(shift)).to_h
      key.merge(key_pairs)
    end
  end

  def solution(key, message)
    message.chars.map {|char| key.fetch(char, char)}.join
  end
end
