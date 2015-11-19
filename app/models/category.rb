class Category < ActiveRecord::Base
  has_many :businesses
  validates_presence_of :name

  def recent_businesses
    businesses.first(6)
  end
end
