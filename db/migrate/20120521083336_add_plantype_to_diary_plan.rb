class AddPlantypeToDiaryPlan < ActiveRecord::Migration
  def change
    add_column :dairy_plans, :plantype, :integer
  end
end
