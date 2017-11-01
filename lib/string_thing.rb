module StringThing
  def self.add(input)
    input.split(/[\n,]/).map(&:to_i).sum
  end
end
