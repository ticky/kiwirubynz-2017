module StringThing
  DELIMITER = /[\n,]/

  def self.add(input)
    delimiter = DELIMITER

    if input[0..1] == '//'
      /^\/\/(?<delimiter>.[^\n]*)\n(?<value>.*)$/m.match(input).tap do |matches|
        delimiter = matches[:delimiter]
        input = matches[:value]
      end
    end

    input.split(delimiter).map(&:to_i).sum
  end
end
