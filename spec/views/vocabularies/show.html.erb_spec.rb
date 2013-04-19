require 'spec_helper'

describe "vocabularies/show" do
  before(:each) do
    @vocabulary = assign(:vocabulary, stub_model(Vocabulary,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
