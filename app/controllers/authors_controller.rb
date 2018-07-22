class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.new  
    if @author.valid?
      @author = Author.create!(author_params)
      @author.save
      redirect_to author_path(@author)
    else
      redirect_to new_author_path
    end
  end

  private

  def author_params

    params.permit(:email, :name)
  end
end
