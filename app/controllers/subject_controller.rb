class SubjectController < ApplicationController

  def list
    prepare_for_list

    @page_title = "お題のリスト"
    @page_title_size = 3
  end

    def prepare_for_list
      @subjects = Subject.find(:all)
      @column_names  = Subject.columns.map(&:name)
    end
    private :prepare_for_list

  def edit
    prepare_for_list
    @subject = Subject.find(params[:id])

    @page_title = "お題の編集"
    @page_title_size = 3
  end
end
