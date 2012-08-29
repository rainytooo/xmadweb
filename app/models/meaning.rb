class Meaning < ActiveRecord::Base
  belongs_to :word, :dependent => :destroy
end
