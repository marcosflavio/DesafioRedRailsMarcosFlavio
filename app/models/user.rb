class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # se um usuario cancelar sua conta, seus posts sao excluidos
  has_many :redweet, dependent: :destroy 
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
         
  has_many :following, through: :active_relationships, source: :followed
         
  has_many :followers, through: :passive_relationships, source: :follower
  
  #metodo para seguir
  def follow(user)
    active_relationships.create(followed_id: user.id)
  end
         
  # metodo para deixar de seguir
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end
         
  # metodo responsavel para saber se um usuario segue outro ou nao
  def following?(user)
    following.include?(user)
  end
    
end