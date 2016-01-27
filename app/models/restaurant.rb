class Restaurant < ActiveRecord::Base
  require 'json'
  def self.search(search)
      where("name LIKE ?", "%#{search}%") 
      where("content LIKE ?", "%#{search}%")
  end
  validates :name, :comments, :website, :location, presence: true
  validates :name, uniqueness: true, length: { maximum: 40 }
  validate :validate_weekdayname

  has_attached_file :image, styles: { medium: "300x300#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  
  def validate_weekdayname
    JSON.parse(opening).each do |day|
      unless Date::DAYNAMES.include? day
        errors.add(:opening, "ist kein gültiger Wochentag")
      end
    end
  end
end
