class Redweet < ActiveRecord::Base
    
    #um redweet pertence a um usuario
    belongs_to :user
  
    #obriga que cada post tenha um usuario_id
    #com isso, certificasse que nao ha como se criar um post sem user
    validates :user_id, presence: true
    
    #certificasse que o conteudo é obrigatorio e que seu tamanho seja de no maximo 140 caracteres
    validates :content, presence: true, length: {maximum: 140}
  
    #definindo a ordem, primeiros posts vêm em primeiro
    default_scope -> { order(created_at: :desc) }
    
end
