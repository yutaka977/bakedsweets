  require 'net/http'
  require 'json'
class Tweet < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :user 
  def self.ransackable_attributes(auth_object = nil)
    ["body", "cost", "created_at", "evaluation", "id", "id_value", "name", "type", "updated_at", "user_id", "prefecture"]
  end
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  belongs_to :type
  def self.ransackable_associations(auth_object = nil)
    ["comments", "image_attachment", "image_blob", "liked_users", "likes", "type", "user"]
  end

  
  def fetch_prefecture
    return unless lat.present? && lng.present?

    api_key = ENV['YOUR_API_KEY']
    url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=#{lat},#{lng}&key=#{api_key}&language=ja"

    uri = URI(url)
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)

    Rails.logger.info "Google Geocoding API レスポンス: #{json}" # APIのレスポンスをデバッグ

    if json["status"] == "OK"
      json["results"].each do |result|
        result["address_components"].each do |component|
          if component["types"].include?("administrative_area_level_1") # 都道府県
            Rails.logger.info "取得した都道府県: #{component["long_name"]}" # デバッグ
            return component["long_name"]
          end
        end
      end
    else
      Rails.logger.error "Google Geocoding API エラー: #{json['status']}"
    end
    nil
  end
  
end
