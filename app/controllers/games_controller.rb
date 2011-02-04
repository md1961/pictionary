class GamesController < ApplicationController

  def index
    @shows_link_to_suspended_game = suspended_game_exist?

    @page_title = "トップページ"
  end

    def suspended_game_exist?
      return used_subjects.size > 0
    end
    private :suspended_game_exist?

    def used_subjects
      return Subject.find(:all, :conditions => "used = 1")
    end
    private :used_subjects

  def start
    clear_subject_used unless params[:resuming_game] == '1'

    redirect_to :action => 'turn'
  end

    def clear_subject_used
      used_subjects.each do |subject|
        subject.used = false
        subject.save
      end
    end
    private :clear_subject_used

  def turn
    @categories = Category.all
    @category_id = 0

    @page_title = "次の問題"
  end

  def show_category
    category_id = params[:category_id].to_i
    if category_id > 0
      @category = Category.find(category_id)
      @ready_to_next = 1
    else
      @category = Category.all.rand
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
      @subject = subjects.rand
      @subject.used = true
      @subject.save
    end

    @ready_to_next = params[:ready_to_next] == '1'

    @page_title = "お題です"
  end
end
