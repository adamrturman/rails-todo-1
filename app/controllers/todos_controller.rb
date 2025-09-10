class TodosController < ApplicationController
  # handles GET request to render all todos
  def index
    # Todo.all is an ActiveRecord method that queries the database for ALL todo records
    # Then we define that to an instance variable that we can access in the view
    @todos = Todo.all 
    @todo = Todo.new
    # after this runs, Rails renders the "index" view
  end

  # handles GET request to show form to create a new todo
  # def new
  #   # create a new todo in memory (not yet store in db)
  #   @todo = Todo.new 
  #   # after this runs, Rails renders the "new" view
  # end

  # handles POST requests to save new todos when the form is submitted
  def create
    @todo = Todo.new(todo_params)

    # if save is successful redirect to the list, otherwise show the form again
    if @todo.save
      redirect_to todos_path
    else
      render :index
    end
  end

  private def todo_params
    params.require(:todo).permit(:title)
  end

end


