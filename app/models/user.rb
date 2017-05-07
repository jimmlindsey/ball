class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :subscriptions, foreign_key: :follower_id, 
                           dependent: :destroy
  has_many :leaders, through: :subscriptions
  
  has_many :reverse_subscriptions, foreign_key: :leader_id,
                                   class_name: 'Subscription',
                                   dependent: :destroy
  has_many :followers, through: :reverse_subscriptions
  
  has_many :posts, dependent: :destroy
  
  def following?(leader)
    leaders.include? leader
  end
  
  def follow!(leader)
    if leader != self && !following?(leader)
      leaders << leader
    end
  end
end
