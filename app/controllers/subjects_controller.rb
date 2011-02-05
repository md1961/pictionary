class SubjectsController < ApplicationController

  $KCODE = 'utf8'

  def index
    prepare_for_list(params)

    @page_title = "お題のリスト"
  end

    ORDER = "phonetic"

    def prepare_for_list(params)
      @category_id    = params[:category_id   ].blank? ? nil : Integer(params[:category_id])
      @name_to_filter = params[:name_to_filter].blank? ? nil : params[:name_to_filter]
      conditions = @category_id    ? ["category_id = ?", @category_id] \
                 : @name_to_filter ? ["name regexp :name or name_zen regexp :name", {:name=>@name_to_filter}] \
                                   : ""
      @subjects            = Subject.find(:all, :conditions => conditions, :order => ORDER)
      @column_names        = Subject.columns.map(&:name) - %w(used)
      @h_count_by_category = Subject.count_by_category
      @categories          = Category.find(:all, :order => "id")
    end
    private :prepare_for_list

  def edit
    prepare_for_list(params)
    @subject = Subject.find(params[:id])

    prepare_for_render_edit
  end

    def prepare_for_render_edit
      @page_title = "お題「#{@subject.name_zen}」の編集"
    end
    private :prepare_for_render_edit

  def update
    h_subject = params[:subject]
    @subject = Subject.find(h_subject[:id])
    if @subject.update_attributes(h_subject)
      redirect_to :action => 'list', :category_id => @subject.category_id
    else
      prepare_for_list(params)
      prepare_for_render_edit
      render :action => 'edit', :category_id => @category_id
    end
  end

  def new
    prepare_for_list(params)
    @subject = Subject.new
    @subject.category_id = @category_id

    prepare_for_render_new
  end

    def prepare_for_render_new
      @subjects.insert(0, Subject.new)
      @page_title  = "お題の作成"
      @page_title += "（#{Category.find(@category_id).name_zen}）" if @category_id
    end
    private :prepare_for_render_new

  def create
    @subject = Subject.new(params[:subject])
    if @subject.save
      redirect_to :action => 'list', :category_id => @subject.category_id
    else
      prepare_for_list(params)
      prepare_for_render_new
      render :action => 'new', :category_id => @category_id
    end
  end
  
  def destroy
    Subject.find(params[:id]).destroy

    redirect_to :action => 'list', :category_id => params[:category_id]
  end

  def filter_by_name
    prepare_for_list(params)

    @page_title = "お題のリスト"
    render :action => 'list'
  end
end
