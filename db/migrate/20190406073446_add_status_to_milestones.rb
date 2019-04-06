class AddStatusToMilestones < ActiveRecord::Migration[5.2]
  def change
    add_column :milestones, :status, :integer, default: 0
  end
end
