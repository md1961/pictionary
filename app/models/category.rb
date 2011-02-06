# vi: set fileencoding=utf-8 :
class Category < ActiveRecord::Base
  has_many :subjects
end
