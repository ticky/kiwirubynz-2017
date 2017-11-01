module StringThing
  DELIMITER = /[\n,]/

  def self.add(input)
    input.split(DELIMITER).map(&:to_i).sum
  end
end
