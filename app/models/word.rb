class Word < ActiveRecord::Base
  #单词的词性是通过 word_property 进行关联的
  belongs_to :word_property
  #每个单词可以属于不同的组
  has_many :word_meanings
  #每个单词对应很多意思
  has_many :meanings
  #one word can belongs to many group
  has_many :paper_words

  #one word has many result_word
  has_many :result_words
end
