class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :description
      t.datetime :end_time
      t.string :type
      t.belongs_to :category, foreign_key: true
      t.belongs_to :creator, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
