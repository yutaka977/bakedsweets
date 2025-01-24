class AddNameToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :name, :string
  end
end
