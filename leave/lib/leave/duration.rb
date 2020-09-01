module Leave
  class Duration < Dry::Struct
    attribute :from, Types::Params::Date
    attribute :to, Types::Params::Date

    def initialize(from:, to:)
      raise ArgumentError if to < from

      super(from: from, to: to)
    end

    def each_date
      raise ArgumentError unless block_given?
      (from..to).each do |date|
        yield date
      end
    end

    def self.from_range(date_range:)
      from, to = date_range.split(' - ')
      new(from: from, to: to)
    end
  end
end
