class AddDetailsToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :lat, :float
    add_column :tweets, :lng, :float
  end
end
