require 'spec_helper'

describe "tag_types/show" do
  before(:each) do
    @tag_type = assign(:tag_type, stub_model(TagType,
      :name => "Name",
      :descrition => "MyText",
      :upid => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
