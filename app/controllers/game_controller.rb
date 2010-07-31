class GameController < ApplicationController

  def index
    @page_title = "トップページ"
  end

  def start
    redirect_to :action => 'turn'
  end

  def turn
    @category_id = 0

    @page_title = "次の問題"
  end

  def show_category
    category_id = params[:category_id].to_i
    if category_id > 0
      @category = Category.find(category_id)
    else
      categories = Category.all
      @category = categories[rand(categories.size)]
    end

    @page_title = "ジャンルが決定されました"
  end

  def show_subject
    subjects = Subject.find(:all, :conditions => ["category_id = ? and used = 0", params[:category_id]])
    @subject = subjects[rand(subjects.size)]

    @page_title = "お題です"
  end
end
