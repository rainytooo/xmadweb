require 'spec_helper'

describe "vocabularies/edit" do
  before(:each) do
    @vocabulary = assign(:vocabulary, stub_model(Vocabulary,
      :name => "MyString"
    ))
  end

  it "renders the edit vocabulary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vocabularies_path(@vocabulary), :method => "post" do
      assert_select "input#vocabulary_name", :name => "vocabulary[name]"
    end
  end
end
