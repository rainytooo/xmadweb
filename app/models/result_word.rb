class ResultWord < ActiveRecord::Base
  belongs_to :result_paper
  belongs_to :word
end
