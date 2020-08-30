module Leave
  class DatesGenerator
    def initialize(duration:)
      @duration = duration
    end

    def call
      data = []
      @duration.each_date do |date|
        data << { date: date.strftime('%d/%m/%Y'), hours: 8.0 }
      end

      data
    end
  end
end
