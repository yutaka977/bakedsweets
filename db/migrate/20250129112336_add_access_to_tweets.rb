class AddAccessToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :access, :float
  end
end
