class Type < ApplicationRecord
  validates :name, presence: true
  #Tagsテーブルから中間テーブルに対する関連付け
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :tweets
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end
