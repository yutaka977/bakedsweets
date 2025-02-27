class AddPrefectureToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :prefecture, :string
  end
end
