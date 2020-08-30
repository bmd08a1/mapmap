class LeaveRequestsController < ApplicationController
  def index
    @requests = Leaves::Request.all
  end

  def new
    @leave_request_id = SecureRandom.uuid
    @employees = [OpenStruct.new(name: 'Dung Bui', id: '123')]
    @categories = [OpenStruct.new(name: 'Annual leave', id: '123')]
  end

  def submit
  end

  def change_duration
    duration = Leave::Duration.new(from: params[:from], to: params[:to])
    new_dates = Leave::DatesGenerator.new(duration: duration).call

    render json: new_dates
  end
end
