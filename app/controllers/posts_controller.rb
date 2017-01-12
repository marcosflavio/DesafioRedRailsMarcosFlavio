class PostsController < ApplicationController
   
   def new
    @redweet = Post.new
   end
   
   def create
     @redweet = Post.new(post_params)
     @redweet.user_id = current_user.id #o redweet recebe o id do usuario que o fez
    respond_to do |f|
        if(@redweet.save)
            f.html{redirect_to "", notice: "Redweet criado com sucesso!"}
        else
            f.html{redirect_to "", notice: "Erro ao Redweetar!"}            
        end
    end
   end
   
   #Metodo para definir quais os parametros que formam um redweet(post)
   private
   def post_params
    params.require(:post).permit(:user_id, :content)
    
   end
end
 