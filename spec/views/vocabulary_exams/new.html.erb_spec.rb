require 'spec_helper'

describe "vocabulary_exams/new" do
  before(:each) do
    assign(:vocabulary_exam, stub_model(VocabularyExam,
      :user_id => 1,
      :child_id => 1
    ).as_new_record)
  end

  it "renders new vocabulary_exam form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vocabulary_exams_path, :method => "post" do
      assert_select "input#vocabulary_exam_user_id", :name => "vocabulary_exam[user_id]"
      assert_select "input#vocabulary_exam_child_id", :name => "vocabulary_exam[child_id]"
    end
  end
end
