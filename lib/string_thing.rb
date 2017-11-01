class StringThing
  DELIMITER = /[\n,]/

  def parse(input)
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
