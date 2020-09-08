module Leave
  class RequestSubmitted < ::Event
    attribute :request_id, Types::UUID
    attribute :duration, Duration
    attribute :category_id, Types::ID
    attribute :employee_id, Types::ID
    attribute :leave_dates, Types::Array.of(Date)
  end
end
