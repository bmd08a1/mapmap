module Leaves
  class Request < ApplicationRecord
    self.table_name = 'leave_requests'

    def duration
      Leave::Duration.new(from: from, to: to)
    end
  end
end
