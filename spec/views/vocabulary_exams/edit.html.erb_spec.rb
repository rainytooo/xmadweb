require 'spec_helper'

describe "vocabulary_exams/edit" do
  before(:each) do
    @vocabulary_exam = assign(:vocabulary_exam, stub_model(VocabularyExam,
      :user_id => 1,
      :child_id => 1
    ))
  end

  it "renders the edit vocabulary_exam form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vocabulary_exams_path(@vocabulary_exam), :method => "post" do
      assert_select "input#vocabulary_exam_user_id", :name => "vocabulary_exam[user_id]"
      assert_select "input#vocabulary_exam_child_id", :name => "vocabulary_exam[child_id]"
    end
  end
end
