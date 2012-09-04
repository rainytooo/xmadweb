class Meaning < ActiveRecord::Base
  belongs_to :word
  # 每个单词的意思是有一个词性
  belongs_to :word_property
end
