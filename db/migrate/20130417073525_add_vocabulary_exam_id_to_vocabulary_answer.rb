class AddVocabularyExamIdToVocabularyAnswer < ActiveRecord::Migration
  def change
    add_column :vocabulary_answers, :vocabulary_exam_id, :integer

  end
end
