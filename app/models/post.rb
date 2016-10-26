class Post < ActiveRecord::Base
  validates :title, :body, presence: true
# Post Controller rspec
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  delegate :username, to: :user

  def self.tagged_with(name)
    Tag.find_by!(name: name).posts
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end
# Posts tagss
  def all_tags
    tags.map(&:name).join(', ')
  end
end
