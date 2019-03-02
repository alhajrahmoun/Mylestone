class CreateMilestones < ActiveRecord::Migration[5.2]
  def change
    create_table :milestones do |t|
      t.string :title
      t.text :story
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
