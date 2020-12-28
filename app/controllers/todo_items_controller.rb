class TodoItemsController < ApplicationController

  def index
    @todoitems = TodoItem.all
  end

  def show
    @todoitem = TodoItem.find(params[:id])
  end

  def new
    @todoitem = TodoItem.new
  end

  def create
    @todoitem = TodoItem.new(todoitem_params)
    if @todoitem.save
      redirect_to @todoitem
    else
      render :new
    end
  end

  def edit
    @todoitem = TodoItem.find(params[:id])
  end

  def update
    @todoitem = TodoItem.find(params[:id])
    if @todoitem.update(todoitem_params)
      redirect_to @todoitem
    else
      render :edit
    end
  end

  def destroy
    @todoitem = TodoItem.find(params[:id])
    @todoitem.destroy
    redirect_to root_path
  end

  private
    def todoitem_params
      params.require(:todo_item).permit(:title, :description)
    end

end
