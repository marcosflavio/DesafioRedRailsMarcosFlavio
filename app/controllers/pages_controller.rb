#Este controller possui as actions necessarias para todas as páginas contidas em views/pages/
class PagesController < ApplicationController
  
  #Action para pages/index
  def index
  end


  #Action para pages/home
  def home
    following = Array.new
    for @f in current_user.following do
      following.push(@f.id)
    end
    
    @u = current_user
    @newRedweet = Redweet.new
    #variavel redweets que contem todos os redweets que foram feitos pelo usuario
    #ou por algum usuario que o mesmo segue
    @redweets = Redweet.where("user_id IN (?) OR user_id = ? ", following, @u.id)
  end
  
  #Action para pages/profile
  def profile
    #capturar o username a partir da Url com id
    if( User.find_by_username(params[:id]))
      @username = params[:id]
      @u= User.find_by_username(params[:id])
    else
      #senao possuir este usuario, redireciona com o alerta
      redirect_to root_path, :notice=> "User not found!"
    end
    
    #disponibilizando somente os redweets do proprio usuario
    @redweets = Redweet.where("user_id = ?", User.find_by_username(params[:id]).id)
        
    @newRedweet = Redweet.new
    @quemSeguir = User.all.last(7) #os ultimos sete usuarios serão os recomendados para a sugestao de seguir
  end
  
  #Action para pages/explore
  def moments
    @u = current_user
    @newRedweet = Redweet.new
    @redweets = Redweet.all
    @quemSeguir = User.all.last(7)
  end
  
end
