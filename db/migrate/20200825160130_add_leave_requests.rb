class AddLeaveRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_requests do |t|
      t.string :uuid
      t.string :status
      t.string :employee

      t.timestamps null: false
    end
  end
end
