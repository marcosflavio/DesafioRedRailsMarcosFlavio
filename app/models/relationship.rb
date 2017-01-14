class Relationship < ActiveRecord::Base
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"
    # para a criacao de uma relacao, sao necessarios o id do seguidor e do seguido
    validates :follower_id, presence: true
    validates :followed_id, presence: true
end