class StudentsController < ApplicationController

  def index #show list of all 
    @students = Student.all
  end

  def show #show single and ducks owned
    @student = Student.find(params[:id])
    @ducks = Duck.all
  end 

  def new 
    @student = Student.new
  end 

  def create #log new student needs validations 
    @student = Student.new(student_params) 

    if @student.save 
      redirect_to student_path(@student)
    else 
      render :new 
    end 

  end 

  def edit # student can edit 
    @student = Student.find(params[:id])
  end 

  def update 
    @student = student.find(params[:id])
    @student.update(student_params)
    redirect_to student_path(@student_params)

  end 


  private 

  def student_params 
    params.require(:student).permit(:name, :mod)
  end 
end

