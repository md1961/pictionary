class GameController < ApplicationController

  def index
    @page_title = "トップページ"
  end

  def start
    redirect_to :action => 'turn'
  end

  def turn
    @page_title = "ジャンルの決定"
  end

  def pick_category
    categories = Category.all
    @category = categories[rand(categories.size)]

    @page_title = "ジャンルが決定されました"
  end

  def show_subject
  end
end
