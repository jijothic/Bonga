class Tag < ActiveRecord::Base
  #post base on tags
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings
  # has_many :posts, through: :posts
end
