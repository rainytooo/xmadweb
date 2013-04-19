require 'spec_helper'

describe "vocabulary_meanings/new" do
  before(:each) do
    assign(:vocabulary_meaning, stub_model(VocabularyMeaning,
      :vocabulary_id => 1,
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new vocabulary_meaning form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vocabulary_meanings_path, :method => "post" do
      assert_select "input#vocabulary_meaning_vocabulary_id", :name => "vocabulary_meaning[vocabulary_id]"
      assert_select "textarea#vocabulary_meaning_content", :name => "vocabulary_meaning[content]"
    end
  end
end
