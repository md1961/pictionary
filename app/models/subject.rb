# vi: set fileencoding=utf-8 :
class Subject < ActiveRecord::Base
  belongs_to :category

  JPN_MSG_UNIQUENESS = "が重複しています"

  validates_presence_of   :name, :name_zen,              :message => "が必要です"
  validates_uniqueness_of :name, :scope => :category_id, :message => JPN_MSG_UNIQUENESS
  validates_uniqueness_of :name_zen,                     :message => JPN_MSG_UNIQUENESS

  HUMANIZED_KEY_NAMES = {
    'id'          => 'ID',
    'name'        => '英語名',
    'name_zen'    => '日本語名',
    'phonetic'    => 'ふりがな',
    'category_id' => 'ジャンル',
    'is_active'   => '使用状況',
  }

  class << self
    def human_attribute_name(name, options={})
      return HUMANIZED_KEY_NAMES[name] || super
    end
  end

  def self.count_by_category
    column_category = 'category_id'
    column_count    = 'COUNT(*)'
    sql = "SELECT #{column_category}, #{column_count} FROM subjects GROUP BY #{column_category}"

    hash_counts = Hash.new
    connection.execute(sql).each_hash do |hash|
      category_id = Integer(hash[column_category])
      count       = Integer(hash[column_count   ])
      hash_counts[category_id] = count
    end

    return hash_counts
  end

  def active?
    return is_active
  end

  def needs_phonetic?
    return (/\A[a-zA-Zぁ-んァ-ンー]+\z/ =~ name_zen).nil?
  end
end
