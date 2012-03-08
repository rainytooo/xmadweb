require 'spec_helper'

describe "advertisements/index" do
  before(:each) do
    assign(:advertisements, [
      stub_model(Advertisement,
        :domain => "Domain",
        :pagename => "Pagename",
        :seqnum => "Seqnum",
        :tagname => "Tagname",
        :display_type => "Display Type",
        :beizhu => "Beizhu"
      ),
      stub_model(Advertisement,
        :domain => "Domain",
        :pagename => "Pagename",
        :seqnum => "Seqnum",
        :tagname => "Tagname",
        :display_type => "Display Type",
        :beizhu => "Beizhu"
      )
    ])
  end

  it "renders a list of advertisements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Domain".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Pagename".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Seqnum".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tagname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Display Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Beizhu".to_s, :count => 2
  end
end
