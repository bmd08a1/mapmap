module Leave
  class OnSubmitRequest
    include CommandHandler

    def call(command)
      with_aggregate(Request, command.aggregate_id) do |request|
        request.submit(command.employee_id, command.category_id, command.duration, command.leave_dates)
      end
    end
  end
end
