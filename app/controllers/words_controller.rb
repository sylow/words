class WordsController < ApplicationController
  def new
  end
  def create
    word = Word.new(params[:word])
    word.save
    flash[:notice] = "The word was saved successfully"
    redirect_to :action => "index"
  end

  def collect
  end

end
