class CreateTrainers < ActiveRecord::Migration[6.1]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :trainer_email
      t.string :password_digest
      t.string :gym_name

      t.timestamps
    end
  end
end
