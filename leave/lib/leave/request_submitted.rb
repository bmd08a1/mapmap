module Leave
  class RequestSubmitted < Event
    attribute :request_id, Types::UUID
    attribute :employee_id, Types::ID
  end
end
