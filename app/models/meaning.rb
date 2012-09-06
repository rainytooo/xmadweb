class Meaning < ActiveRecord::Base
  belongs_to :word
  # 多个意思对应词性
  belongs_to :word_property
end
