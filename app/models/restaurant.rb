class Restaurant < ActiveRecord::Base
  def self.search(search)
      where("name LIKE ?", "%#{search}%") 
      where("content LIKE ?", "%#{search}%")
  end
  validates :name, :comments, :website, :location, presence: true
  validates :name, uniqueness: true, length: { maximum: 40 }

  has_attached_file :image, styles: { medium: "300x300#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

   geocoded_by :location   # can also be an IP address
   after_validation :geocode          # auto-fetch coordinates
end
