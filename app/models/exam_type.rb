class ExamType < ActiveRecord::Base
  has_many :papers, :dependent => :destroy
end
