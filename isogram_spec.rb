# An isogram is a word that has no repeating letters, consecutive or
# non-consecutive. Implement a function that determines whether a string that
# contains only letters is an isogram. Assume the empty string is an isogram.
# Ignore letter case.
#
# is_isogram("Dermatoglyphics" ) == true
# is_isogram("aba" ) == false
# is_isogram("moOse" ) == false # -- ignore letter case

RSpec.describe 'determines if a word is an isogram' do
  describe 'an isogram' do
    context 'empty string' do
      it 'is an isogram' do
        expect('').to be_an_isogram
      end
    end

    context 'a two-letter word' do
      it 'is an isogram' do
        expect('be').to be_an_isogram
      end
    end

    context 'a three-letter word' do
      it 'is an isogram' do
        expect('hut').to be_an_isogram
      end
    end

    context 'fifteen-letter word' do
      it 'is an isogram' do
        expect('Dermatoglyphics').to be_an_isogram
      end
    end
  end

  describe 'not an isogram' do
    context 'a two-letter word' do
      it 'is not an isogram' do
        expect('ee').to_not be_an_isogram
      end
    end

    context 'non-adjacent characters' do
      it 'is not an isogram' do
        expect('aba').to_not be_an_isogram
      end
    end

    context 'same characters with difference cases' do
      it 'is not an isogram' do
        expect('moOse').to_not be_an_isogram
        expect('isIsogram').to_not be_an_isogram
      end
    end

    context 'a seven-letter word' do
      it 'is not an isogram' do
        expect('fervent').to_not be_an_isogram
      end
    end
  end
end

class String
  def isogram?
    word = self.downcase.split ''

    results = []
    while word.length > 0
      head, tail = word.shift, word
      results << tail.select { |e| e == head }
    end
    results.flatten.empty?
  end
end
