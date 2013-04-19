require 'spec_helper'

describe "vocabulary_exams/show" do
  before(:each) do
    @vocabulary_exam = assign(:vocabulary_exam, stub_model(VocabularyExam,
      :user_id => 1,
      :child_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
