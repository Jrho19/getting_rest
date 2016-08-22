class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :first_name
      t.string :last_name
      t.string :comments

      t.timestamps
    end
  end
end
