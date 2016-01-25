class Restaurant < ActiveRecord::Base
  def self.search(search)
      where("name LIKE ?", "%#{search}%") 
      where("content LIKE ?", "%#{search}%")
  end
  validates :name, :comments, :website, :location, presence: true
  validates :name, uniqueness: true, length: { maximum: 40 }
end
