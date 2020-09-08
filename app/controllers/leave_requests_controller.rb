class LeaveRequestsController < ApplicationController
  def index
    @requests = Leaves::Request.all
  end

  def show
    @request = Leaves::Request.find_by(uid: params[:id])
    @dates = Leaves::Date.where(request_uid: params[:id])
  end

  def new
    @leave_request_id = SecureRandom.uuid
    @employees = [OpenStruct.new(name: 'Dung Bui', id: '123')]
    @categories = [OpenStruct.new(name: 'Annual leave', id: '123')]
  end

  def submit
    leave_dates = params[:leave_dates].map { |ld| Leave::Date.new(date: ld[:date], hours: ld[:hours].to_f) }
    duration = Leave::Duration.from_range(date_range: params[:duration])
    command = Leave::SubmitRequest.new(request_id: params[:leave_request_id], duration: duration,
                                       category_id: params[:category_id].to_i, employee_id: params[:employee_id].to_i,
                                       leave_dates: leave_dates)
    command_bus.(command)
    redirect_to leave_request_path(command.request_id)
  end

  def change_duration
    duration = Leave::Duration.new(from: params[:from], to: params[:to])
    new_dates = Leave::DatesGenerator.new(duration: duration).call

    render json: new_dates
  end
end
