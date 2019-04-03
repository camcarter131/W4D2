class CatsController < ApplicationController
  def edit 
    @cat = Cat.find(params[:id])
    render :edit 
  end 

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      render :show
    else
      flash[:errors] = @cat.errors.full_messages
      render :edit
      # render json: @cat.errors.full_messages, status: 422
    end
  end 

  def index 
    @cats = Cat.all
    render :index
  end

  def new
    @cat = Cat.new 
    render :new
  end

  def create
    @cat = Cat.create!(cat_params)
    if @cat.save
      render :show
    else
      flash[:errors] = @cat.errors.full_messages
      render :new
    end

  end

  def show 
    @cat = Cat.find_by(id: params[:id])
    render :show 
  end 

  private 

  def cat_params 
    params.require(:cat).permit(:name, :description, :sex, :birth_date, :color)
  end 

end
