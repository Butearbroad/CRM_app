class CrmsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
      @crm = Crm.all
    end
  
    def show
      @crm = Crm.find(params[:id])
    end
  
    def new
      @crm = Crm.new
    end
  
    def create
      @crm = Crm.new(crm_params)
      @crm.user = current_user
      
      if @crm.save
        redirect_to @crm, notice: 'Товар успешно создан.'
      else
        render :new, status: 422
      end
    end
  
    def edit
      @crm = Crm.find(params[:id])
    end
  
    def update
      @crm = Crm.find(params[:id])
      
      if @crm.update(crm_params)
        redirect_to @crm, notice: 'Товар успешно загружен.'
      else
        render :edit
      end
    end
  
    def destroy
      @crm = Crm.find(params[:id])
      @crm.destroy
      
      redirect_to crms_url, notice: 'Товар успешно удален.'
    end
  
    private
  
    def crm_params
      params.require(:crm).permit(:title, :picture, :description, :price, :quantity)
    end
  end