#Este controller possui as actions necessarias para todas as páginas contidas em views/pages/..
class PagesController < ApplicationController
  
  #Action para pages/index
  def index
  end

  #Action para pages/home
  def home
    @posts = Post.all
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
    #@posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @posts = Post.all
    
    #variavel para criar um novo redweet 
    @newRedweet = Post.new
  end
  
  #Action para pages/explore
  def explore
    @posts = Post.all
  end
  
end
