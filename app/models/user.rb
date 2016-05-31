class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy

  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: 	:destroy

  has_many :followers, through: :passive_relationships, source: :follower

  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: 	:destroy

  has_many :followings, through: :active_relationships, source: :followed

  # # add this

  # def avatar?
  #   #code
  # end
  # validate :avatar_image_size
  #
  # mount_uploader :avatar, AvatarUploader
  #
  # # Validates the size on an uploaded image.
  # def avatar_image_size
  #   errors.add(:avatar, 'should be less than 5MB')
  #   if avatar.size > 5.megabytes
  #     errors.add(:avatar, "should be less than 5MB")
  #   end
  # end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following_ids.include?(other_user.id)
  end

  validates :username, presence: true

  mount_uploader :avatar, AvatarUploader
end
