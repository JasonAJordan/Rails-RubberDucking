class DucksController < ApplicationController

  def index #show list of all 
    @ducks = Duck.all
  end

  def show #show single and ducks owned
    @duck = Duck.find(params[:id])
  end 

  def new 
    @duck = Duck.new
    @students = Student.all
  end 

  def create #log new duck needs validations 
    @duck = Duck.new(duck_params) 

    if @duck.save 
      redirect_to duck_path(@duck)
    else 
      render :new 
    end 

  end 

  def edit # duck can edit 
    @duck = Duck.find(params[:id])
    @students = Student.all
  end 

  def update 
    @duck = Duck.find(params[:id])
    @duck.update(duck_params)
    redirect_to duck_path(@duck_params)

  end 

  private 

  def duck_params 
    params.require(:duck).permit(:name, :description, :student_id)
  end 

end
