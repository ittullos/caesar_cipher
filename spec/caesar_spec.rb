require './lib/caesar_cipher.rb'

describe 'caesar cipher' do
  before { @cipher = CaesarCipher.new }

  context 'valid input' do
    it 'works with What a string! and 5' do
      expect(@cipher.solve('What a string!', 5)).to eq 'Bmfy f xywnsl!'
    end

    it 'works with Hello World! and 7' do
      expect(@cipher.solve('Hello World!', 7)).to eq 'Olssv Dvysk!'
    end

    it 'works with Hey, my name is Isaac. and 1' do
      expect(@cipher.solve('Hey, my name is Isaac.', 1)).to eq 'Ifz, nz obnf jt Jtbbd.'
    end

    it 'works with Hi/Hello/A-154 and -2' do
      expect(@cipher.solve('Hi/Hello/A-154', -2)).to eq 'Fg/Fcjjm/Y-932'
    end
  end
end
