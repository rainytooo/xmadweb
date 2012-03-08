require 'spec_helper'

describe "advertisements/show" do
  before(:each) do
    @advertisement = assign(:advertisement, stub_model(Advertisement,
      :domain => "Domain",
      :pagename => "Pagename",
      :seqnum => "Seqnum",
      :tagname => "Tagname",
      :display_type => "Display Type",
      :beizhu => "Beizhu"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Domain/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pagename/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Seqnum/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tagname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Display Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Beizhu/)
  end
end
