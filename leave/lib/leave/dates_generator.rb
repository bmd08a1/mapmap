module Leave
  class DatesGenerator
    def initialize(duration:)
      @duration = duration
    end

    def call
      data = []
      @duration.each_date do |date|
        data << Date.new(date: date, hours: 8.0).to_h
      end

      data
    end
  end
end
