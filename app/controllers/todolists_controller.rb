class TodolistsController < ApplicationController
  def create
    @todolist=Todolist.new(todo_params)
    if @todolist.save!
      redirect_to todolists_path, notice: 'Item added!'
    else
      render "new", notice: @todolist.errors
    end
  end

  def show
  end

  def edit
  end

  def update
    @todolist=Todolist.find(params[:id])
    if @todolist.update_attribute(:done, true)
      redirect_to todolists_path, notice: "Todo item marked as done!"
    else
      redirect_to todolists_path, notice: "Todo item cannot be marked as done!"
    end
  end

  def new
    @todolist = Todolist.new
  end

  def destroy
    @todolist=Todolist.find(params[:id])
    @todolist.destroy

    redirect_to todolists_path, notice: "Todo item deleted!"
  end

  def index
    @todos = todolist.pending
    @todone = todolist.done
  end

  def todo_params
    params.require(:todolist).permit(:task, :duedate).tap do |p|
      p[:user_id] = current_user.id
    end
  end

  private

  def todolist
    Todolist.where(user_id: current_user.id)
  end
end


