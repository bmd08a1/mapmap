module Leave
  class Date
    include Comparable
    attr_reader :date, :units

    def initialize(date, units)
      @date = date
      @units = units
    end

    def <=>(other)
      self.date <=> other.date
    end
  end
end

