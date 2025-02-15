class Tweet < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :user 
  def self.ransackable_attributes(auth_object = nil)
    ["body", "cost", "created_at", "evaluation", "id", "id_value", "name", "type", "updated_at", "user_id"]
  end
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  belongs_to :type
  def self.ransackable_associations(auth_object = nil)
    ["comments", "image_attachment", "image_blob", "liked_users", "likes", "type", "user"]
  end

end
