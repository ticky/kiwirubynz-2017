require 'string_thing'

RSpec.describe 'StringThing' do
  subject(:calculator) { StringThing.new }

  describe 'parse' do
    it 'returns 0 for an empty string' do
      expect(calculator.parse('')).to eql(0)
    end

    it 'returns sum of comma-separated numbers' do
      expect(calculator.parse('1,2')).to eql(3)
      expect(calculator.parse('1,2,3')).to eql(6)
    end

    it 'returns sum of newline-delimited numbers' do
      expect(calculator.parse("1\n2")).to eql(3)
      expect(calculator.parse("1\n2\n3")).to eql(6)
    end

    it 'returns sum of mixed newline and comma-delimited numbers' do
      expect(calculator.parse("1,2\n3")).to eql(6)
      expect(calculator.parse("1\n2,3")).to eql(6)
    end

    it 'supports overriding the delimiter' do
      expect(calculator.parse("//\b\n1\b2\b3")).to eql(6)
      expect(calculator.parse("//lolhi\n5lolhi6lolhi7lolhi8")).to eql(26)
    end
  end
end
