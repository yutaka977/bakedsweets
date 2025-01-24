class AddTypeIdToTweets < ActiveRecord::Migration[7.1]
  def change
    add_reference :tweets, :type, null: false, foreign_key: true
  end
end
