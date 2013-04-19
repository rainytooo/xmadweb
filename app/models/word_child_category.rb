# encoding: utf-8
class WordChildCategory < ActiveRecord::Base
	belongs_to :word_category
   has_many :vocabularies, :dependent => :destroy
   
   has_many :vocabulary_exams, :dependent => :destroy
	# 保存上传文件的内容
	# by Ryan
	# 2013-04-16
   	 def self.save_options(id, row)
   	 	@word = self.find(id)

   	 		Vocabulary.transaction do
   	 			voc = @word.vocabularies.new(:name => row[0])

   	 			row[1].gsub('，',',').split(",").each do |index|
   	 				VocabularyMeaning.transaction do
	   	 				meaning = voc.vocabulary_meanings.new(:content => index)
	   	 				meaning.save!
	   	 			end
   	 			end
   	 			
   	 			begin
   	 				voc.vocabulary_type_list.add(row[2].gsub('，',',').split(","))
   	 			rescue Exception => e
   	 				puts e
   	 			end

   	 			voc.save!
   	 		end

    end
end
