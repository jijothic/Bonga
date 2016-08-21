class Tagging < ActiveRecord::Base
  #tagging must have post a user :)
  belongs_to :post
  # Post must belong to a tag 
  belongs_to :tag
end
