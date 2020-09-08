require 'aggregate_root'

module Leave
  class Request
    include AggregateRoot

    AlreadySubmitted = Class.new(StandardError)

    def initialize(id)
      @id = id
      @status = :draft
      @dates = []
    end

    def submit(employee_id, category_id, duration, leave_dates)
      raise AlreadySubmitted if @status != :draft
      apply RequestSubmitted.new(
        data: {
          request_id: @id,
          employee_id: employee_id,
          category_id: category_id,
          duration: duration,
          leave_dates: leave_dates
        }
      )
    end

    on RequestSubmitted do |event|
      @employee_id = event.data[:employee_id]
      @category_id = event.data[:category_id]
      @duration = event.data[:duration]
      @dates = event.data[:leave_dates]
      @status = :pending
    end
  end
end
