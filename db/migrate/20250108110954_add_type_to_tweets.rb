class AddTypeToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :type, :string
  end
end
