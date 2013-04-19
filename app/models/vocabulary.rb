# encoding: utf-8
class Vocabulary < ActiveRecord::Base
	# 添加关联关系
	# by Ryan 
	# 2013-04-15
	has_many :vocabulary_meanings, :dependent => :destroy
	belongs_to :word_child_category
	# validates_presence_of :content
	
	# 添加标签
	# by Ryan 
	# 2013-04-16
	acts_as_taggable
	acts_as_taggable_on :vocabulary_types  
end
