class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]


  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to @todo_list, notice: 'Votre tache a bien été créée !' }
        format.js
      end
    end
  end

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    @todo_item.destroy
    respond_to do |format|
      flash[:success] = "Votre tache a été supprimée !"
      format.html { redirect_to @todo_list }
      format.js
    end
  end

  def complete
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to @todo_list, notice: "Votre tache a été mise à jour !"
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end

end
