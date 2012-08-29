class ExamType < ActiveRecord::Base
  has_many :papers
end
