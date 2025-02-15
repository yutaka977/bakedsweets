class AddEvaluationcostToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :evaluationcost, :float
  end
end
