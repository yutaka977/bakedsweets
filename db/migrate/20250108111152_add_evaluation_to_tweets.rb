class AddEvaluationToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :evaluation, :string
  end
end
