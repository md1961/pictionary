class GameController < ApplicationController

  def index
    @page_title = "トップページ"
  end

  def start
    clear_subject_used

    redirect_to :action => 'turn'
  end

    def clear_subject_used
      Subject.find(:all, :conditions => "used = 1").each do |subject|
        subject.used = false
        subject.save
      end
    end
    private :clear_subject_used

  def turn
    @category_id = 0

    @page_title = "次の問題"
  end

  def show_category
    category_id = params[:category_id].to_i
    if category_id > 0
      @category = Category.find(category_id)
      @ready_to_next = 1
    else
      categories = Category.all
      @category = categories[rand(categories.size)]
      @ready_to_next = 0
    end

    @subject_id = params[:subject_id].to_i

    @page_title = "ジャンルが決定されました"
  end

  def show_subject
    subject_id = params[:subject_id].to_i
    if subject_id > 0
      @subject = Subject.find(subject_id)
    else
      subjects = Subject.find(:all, :conditions => ["category_id = ? and used = 0", params[:category_id]])
      @subject = subjects[rand(subjects.size)]
      @subject.used = true
      @subject.save
    end

    @ready_to_next = params[:ready_to_next] == '1'

    @page_title = "お題です"
  end
end
