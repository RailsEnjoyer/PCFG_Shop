class AddMinBudgetToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :min_budget, :integer
  end
end
