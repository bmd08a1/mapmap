module Leave
  class Duration < Struct.new(:from, :to)
    def initialize(from:, to:)
      from_date = ::Date.parse(from)
      to_date = ::Date.parse(to)
      raise ArgumentError if to_date < from_date

      super(from_date, to_date)
    rescue Date::Error
      raise ArgumentError
    end

    def each_date
      raise ArgumentError unless block_given?
      (from..to).each do |date|
        yield date
      end
    end
  end
end
