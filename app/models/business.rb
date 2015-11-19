class Business < ActiveRecord::Base
  belongs_to :category
  has_many :reviews
  validates_presence_of :name, :description, :picture_url
  validates_uniqueness_of :name
end
