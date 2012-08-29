class PaperWord < ActiveRecord::Base
  belongs_to :paper
  belongs_to :word
end
