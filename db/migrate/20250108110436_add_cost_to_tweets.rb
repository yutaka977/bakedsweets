class AddCostToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :cost, :integer
  end
end
