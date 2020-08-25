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

    def submit(employee_id)
      raise AlreadySubmitted if @status != :draft
      apply RequestSubmitted.new(data: { request_id: @id, employee_id: employee_id })
    end

    on RequestSubmitted do |event|
      @employee_id = event.data[:employee_id]
      @status = :pending
    end
  end
end
