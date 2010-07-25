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

    prepare_for_render_edit
  end

    def prepare_for_render_edit
      @page_title = "お題「#{@subject.name_zen}」の編集"
      @page_title_size = 3
    end
    private :prepare_for_render_edit

  def update
    h_subject = params[:subject]
    @subject = Subject.find(h_subject[:id])
    if @subject.update_attributes(h_subject)
      redirect_to :action => 'list'
    else
      prepare_for_list
      prepare_for_render_edit
      render :action => 'edit'
    end
  end
end
