module Leave
  class Duration < Struct.new(:from, :to)
    def initialize(from:, to:)
      from_date = Date.parse(from)
      to_date = Date.parse(to)
      raise ArgumentError if to_date < from_date

      super(from_date, to_date)
    end

    def each
      raise ArgumentError unless block_given?
      (from..to).each do |date|
        yield date
      end
    end
  end
end
