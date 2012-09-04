class WordProperty < ActiveRecord::Base
  #一个词性通过意思有多个单词对应 
  has_many :words, :through => :meanings
  #一个单词词性对应多个意思
  has_many :meanings
end
