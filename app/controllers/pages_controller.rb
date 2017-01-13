#Este controller possui as actions necessarias para todas as páginas contidas em views/pages/..
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
    @redweets = Redweet.where("user_id IN (?) OR user_id = ? ", following, @u.id)
  
  end
  
  #Action para pages/profile
  def profile
    
    #capturar o username a partir da Url com id
    if( User.find_by_username(params[:id]))
    @username = params[:id]
    else
      #senao possuir este usuario, redireciona para o 404
      redirect_to root_path, :notice=> "User not found!"
    end
    
    #disponibilizando somente os posts do proprio usuario
    @redweets = Redweet.where("user_id = ?", User.find_by_username(params[:id]).id)
        
    #variavel para criar um novo redweet 
    @newRedweet = Redweet.new
    @quemSeguir = User.all.last(7)
  
  end
  
  #Action para pages/explore
  def moments
    @newRedweet = Redweet.new
    @redweets = Redweet.all
    @quemSeguir = User.all.last(7)
    
  end
  
end
