class Tagging < ActiveRecord::Base
  #tagging must have post a user
  belongs_to :post
  belongs_to :tag
end
