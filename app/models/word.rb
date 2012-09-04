class Word < ActiveRecord::Base
  #每个单词对应很多意思
  has_many :meanings, :dependent => :destroy
  #one word can belongs to many group
  has_many :paper_words

  #one word has many result_word
  has_many :result_words

  # 一个单词对应多个词性
  has_many :word_properties, :through => :meanings
end
