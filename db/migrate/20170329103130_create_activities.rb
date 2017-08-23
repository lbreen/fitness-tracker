class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.date :date
      t.float :time_taken
      t.text :comments
      t.references :exercise, foreign_key: true

      t.timestamps
    end
  end
end
