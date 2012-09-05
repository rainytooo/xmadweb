class WordProperty < ActiveRecord::Base
  has_many :words, :through => :meanings
  has_many :meanings
end
