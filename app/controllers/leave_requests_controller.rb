class LeaveRequestsController < ApplicationController
  def index
    @requests = Leaves::Request.all
  end
end
