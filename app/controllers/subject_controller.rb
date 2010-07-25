class SubjectController < ApplicationController

  def list
    @subjects = Subject.find(:all)
    @column_names  = Subject.columns.map(&:name)

    @page_title = "お題のリスト"
    @page_title_size = 3
  end
end
