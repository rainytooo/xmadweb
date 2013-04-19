# encoding: utf-8
class VocabularyExam < ActiveRecord::Base
	has_many :vocabulary_answers,
		:dependent => :destroy
	# 关联关系
	belongs_to :word_child_category, :foreign_key => 'child_id'

	# 考生的试卷
  	# 作者： ryan
 	# 添加时间: 2013-4-17
 	def self.save_answer(user_id, word_child_category_id, arr)
 		VocabularyExam.transaction do 
 			ve = self.new(:user_id => user_id, :child_id => word_child_category_id)
 			arr.each do |k,v|
 				VocabularyAnswer.transaction do 
 					voc = ve.vocabulary_answers.new(:vocabulary_id => k, :content => v, :is_correct =>  check_exist(k, v))
 					voc.save
 				end
 			end
 			ve.save!
 		end
 	end

 	private 
 	def self.check_exist(k, v)
 		flag = false
		begin
			all = Vocabulary.find(k).vocabulary_meanings
			same_item =  v.gsub('，',',').split(",")
			all.each do |a|
				if same_item.include?a.content
					flag = true
					break
				end
			end
		rescue Exception => e

		end
		return flag
 	end
end
