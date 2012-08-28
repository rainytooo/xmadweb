class ResultPaper < ActiveRecord::Base
  has_many :result_words, :dependent => :destroy
  belongs_to :user
  belongs_to :paper
end
