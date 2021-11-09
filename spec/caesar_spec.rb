require './caesar_cipher'

describe 'solve' do
  before { @cipher = CaesarCipher.new }
  it 'shifts a letter by a given value' do
    expect(@cipher.solve("a", 3)).to eql("d")
  end

  it 'shifts a string by a given value' do
    expect(@cipher.solve("aaa", 3)).to eql("ddd")
  end

  it 'shifts a string by a negative value' do
    expect(@cipher.solve("ccc", -2)).to eql("aaa")
  end

  it 'leaves punctuation and symbols intact' do
    expect(@cipher.solve("abc!@><", 3)).to eql("def!@><")
  end

  it 'accounts for spaces in the string' do
    expect(@cipher.solve("What a string!", 3)).to eql("Zkdw d vwulqj!")
  end

  it 'wraps from the end of the alphabet to the beginning' do
    expect(@cipher.solve("xyz", 2)).to eql("zab")
  end

  it 'wraps from the beginning of the alphabet to the end' do
    expect(@cipher.solve("abc", -2)).to eql("yza")
  end

  it 'leaves uppercase and lowercase intact when wrapping to end' do
    expect(@cipher.solve("aBcD", -3)).to eql("xYzA")
  end

  it 'leaves uppercase and lowercase intact when wrapping to beginning' do
    expect(@cipher.solve("xYzA", 3)).to eql("aBcD")
  end

  it 'handles numbers correctly when wrapping to beginning' do
    expect(@cipher.solve("789", 2)).to eql("901")
  end

  it 'handles numbers correctly when wrapping to end' do
    expect(@cipher.solve("123", -2)).to eql("901")
  end

  it 'converts a message and deciphers message back into original' do
    expect(@cipher.solve(@cipher.solve("The British are coming!!", 2), -2)).to eql("The British are coming!!")
  end
end
