class RelationshipsController < ApplicationController
    
    def create
        
        #encontro o usuario do perfil
        user = User.find(params[:followed_id])
        
        #meu usuario atual agora segue este outro usuario
        current_user.follow(user)
        
        #redireciono a pagina
        redirect_to(:back)
    end
    
    def destroy
        
        #encontro qual o usuario que estou deixando de seguir
        user = Relationship.find(params[:id]).followed 
        
        #mando ele pro metodo unfollow, desfazendo assim a relação
        current_user.unfollow(user)
        
        #redireciono a página
        redirect_to(:back)
    end
    
end