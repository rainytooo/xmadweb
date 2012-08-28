class WordMeaning < ActiveRecord::Base
  belongs_to :word
  belongs_to :meaning
end
