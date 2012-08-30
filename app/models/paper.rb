class Paper < ActiveRecord::Base
  has_many :meanings
  has_many :exams, :dependent => :destroy
  has_many :paper_words, :dependent => :destroy
  belongs_to :exam_type
  has_many :result_papers, :dependent => :destroy
end
