class Subject < ActiveRecord::Base
  belongs_to :category

  validates_presence_of   :name, :name_zen
  validates_uniqueness_of :name, :name_zen

  HUMANIZED_KEY_NAMES = {
    'id'          => 'ID',
    'name'        => '英語名',
    'name_zen'    => '日本語名',
    'phonetic'    => 'ふりがな',
    'category_id' => 'ジャンル',
    'is_active'   => '使用状況',
  }

  class << self
    def human_attribute_name(name)
      return HUMANIZED_KEY_NAMES[name] || super
    end
  end

  def active?
    return is_active
  end
end
