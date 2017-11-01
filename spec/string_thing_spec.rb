require 'string_thing'

RSpec.describe StringThing do
  describe 'add' do
    it 'returns 0 for an empty string' do
      expect(StringThing.add('')).to eql(0)
    end

    it 'returns sum of comma-separated numbers' do
      expect(StringThing.add('1,2')).to eql(3)
      expect(StringThing.add('1,2,3')).to eql(6)
    end

    it 'returns sum of newline-delimited numbers' do
      expect(StringThing.add("1\n2")).to eql(3)
      expect(StringThing.add("1\n2\n3")).to eql(6)
    end

    it 'returns sum of mixed newline and comma-delimited numbers' do
      expect(StringThing.add("1,2\n3")).to eql(6)
      expect(StringThing.add("1\n2,3")).to eql(6)
    end
  end
end
