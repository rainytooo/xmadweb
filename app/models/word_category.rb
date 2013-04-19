# encoding: utf-8
class WordCategory < ActiveRecord::Base
	has_many :word_child_categories, :dependent => :destroy
end
