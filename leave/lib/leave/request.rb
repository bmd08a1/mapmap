require 'aggregate_root'

module Leave
  class Request
    include AggregateRoot

    def initialize(id)
      @id = id
      @status = :pending
      @dates = []
    end
  end
end
