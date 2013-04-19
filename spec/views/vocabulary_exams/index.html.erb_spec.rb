require 'spec_helper'

describe "vocabulary_exams/index" do
  before(:each) do
    assign(:vocabulary_exams, [
      stub_model(VocabularyExam,
        :user_id => 1,
        :child_id => 1
      ),
      stub_model(VocabularyExam,
        :user_id => 1,
        :child_id => 1
      )
    ])
  end

  it "renders a list of vocabulary_exams" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
