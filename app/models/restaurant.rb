class Restaurant < ActiveRecord::Base
  DAYNAMES = %w(Montag Dienstag Mittwoch Donnerstag Freitag Samstag Sonntag)
  require 'json'
  def self.search(search)
      where("name LIKE ?", "%#{search}%") 
      where("content LIKE ?", "%#{search}%")
  end
  validates :name, :comments, :website, :location, presence: true
  validates :name, uniqueness: true, length: { maximum: 20 }
  validate :validate_weekdayname

  has_attached_file :image, styles: { medium: "300x300#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  
  def validate_weekdayname
    opening_days.each do |day|
      unless Restaurant::DAYNAMES.include? day
        errors.add(:opening, "ist kein gültiger Wochentag")
      end
    end
  end

  def opening_days
    JSON.parse(opening)
  end

  def opening_days_string
    opening_days.join(', ')
  end
end
