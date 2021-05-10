class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :appt_datetime
      t.integer :trainer_id
      t.integer :client_id

      t.timestamps
    end
  end
end
