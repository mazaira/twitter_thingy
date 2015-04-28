class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :active_relationship, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :passive_relationship, class_name: 'Follow', foreign_key: 'followed_id'
  has_many :block_relationship, class_name: 'Follow', foreign_key: 'follower_id'
  
  has_many :following, through: :active_relationship, source: :followed
  has_many :followers, through: :passive_relationship, source: :follower
  has_many :blocked_users, through: :block_relationship, source: :followed
  has_many :tweets

  def self.search(search)
      User.where('name LIKE ?', "%#{search}%")
  end

  def follow(user)
    unless is_blocked?(user)
      active_relationship.create(followed: user)
    else
      raise 'Sorry, the user that you try to follow blocked you'
    end
  end

  def unfollow(user)
    active_relationship.find_by(followed: user).destroy
  end

  def following?(user)
    following.include?(user)
  end

  def block(user)
    block_relationship.create(follower: user)
  end

  def unblock(user)
    block_relationship.find_by(followed: user).destroy
  end

  private

  def is_blocked?(user)
    blocked_users.include?(user)
  end

end
