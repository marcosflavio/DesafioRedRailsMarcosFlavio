class Post < ActiveRecord::Base
  belongs_to :user
  
  #validates serve para "obrigar" que em cada post tenha um usuario_id
  #com isso, certificasse que nao ha como se criar um post sem user
  validates :user_id, presence: true
  #certificasse que o conteudo é obrigatorio tbm
  #certificasse que o tamanho maximo do conteudo do post  seja 140 caracteres
  validates :content, presence: true, length: {maximum: 140}
  
  #definindo a ordem, primeiros posts vêm em primeiro
  default_scope -> { order(created_at: :desc) }
end