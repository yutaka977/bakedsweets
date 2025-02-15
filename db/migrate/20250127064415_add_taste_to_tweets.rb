class AddTasteToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :taste, :float
  end
end
