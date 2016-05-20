class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.integer :user_id
      t.string :task
      t.boolean :done
      t.date :duedate

      t.timestamps null: false
    end
  end
end
