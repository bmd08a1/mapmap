module Leave
  class Date < Dry::Struct
    include Comparable
    attribute :date, Types::Params::Date
    attribute :hours, Types::Strict::Float

    def <=>(other)
      self.date <=> other.date
    end

    def to_h
      { date: date, hours: hours }
    end
  end
end
