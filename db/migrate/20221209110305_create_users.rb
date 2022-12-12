class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_no
      t.string :mail_id
      t.date :DOB
      t.string :activated

      t.timestamps
    end
  end
end
