class AddLeaveRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_requests do |t|
      t.string :uid
      t.string :status
      t.string :employee
      t.string :category
      t.date :from
      t.date :to
      t.float :total_hours

      t.timestamps null: false
    end
  end
end
