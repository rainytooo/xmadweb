require 'spec_helper'

describe "vocabularies/new" do
  before(:each) do
    assign(:vocabulary, stub_model(Vocabulary,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new vocabulary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vocabularies_path, :method => "post" do
      assert_select "input#vocabulary_name", :name => "vocabulary[name]"
    end
  end
end
