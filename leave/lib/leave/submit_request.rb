module Leave
  class SubmitRequest < Command
    attribute :request_id, Types::UUID
    attribute :duration, Duration
    attribute :category_id, Types::ID
    attribute :employee_id, Types::ID
    attribute :leave_dates, Types::Array.of(Date)

    alias :aggregate_id :request_id
  end
end
