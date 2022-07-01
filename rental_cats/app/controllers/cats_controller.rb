class CatsController < ActionController::Base
    def index 
        @cats = Cat.all
        render :index
    end 

    def show 
        @singular_cat = Cat.find_by(id: params[:id])
        render :show 
    end 

    def new 
        render :new
    end 

    def edit 
        @singular_cat = Cat.find_by(id: params[:id])
        render :edit 
    end 

     def create
        @cat = Cat.new(cat_params) #mass assigment 

        if @cat.save
        redirect_to cat_url(@cat)
        else
        render json: @cat.errors.full_messages, status: :unprocessable_entity
        end 
    end 

    def update 
        @cat = Cat.find(params[:id]) # find the chirp

        if @cat.update(cat_params) # if it does sucessfully update 
            redirect_to cat_url(@cat) # show page 
        else 
            render json: @cat.errors.full_messages, status: :unprocessable_entity
        end 
    end 

     def destroy #:id wildcard specific 
    
        @cat = Cat.find(params[:id]) # find the chirp
        @cat.destroy #this is the built in Activerecord object instance method 
        redirect_to cats_url ### request respond cycle 
    end 


    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end


end