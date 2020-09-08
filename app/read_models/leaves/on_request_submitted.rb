module Leaves
  class OnRequestSubmitted
    def call(event)
      leave_dates = event.data.delete(:leave_dates)
      total_hours = leave_dates.sum { |ld| ld[:hours] }

      create_request(event.data, total_hours)

      leave_dates.each do |leave_date|
        create_leave_date(event.data[:request_id], leave_date)
      end
    end

    private

    def create_request(data, total_hours)
      Request.create!(
        uid: data[:request_id],
        status: 'pending',
        employee: 'Map Bui',
        category: 'Annual leave',
        from: data[:duration][:from],
        to: data[:duration][:to],
        total_hours: total_hours
      )
    end

    def create_leave_date(request_uid, leave_date)
      Date.create!(
        request_uid: request_uid,
        date: leave_date[:date],
        hours: leave_date[:hours]
      )
    end
  end
end
