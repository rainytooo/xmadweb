require 'spec_helper'

describe "advertisements/edit" do
  before(:each) do
    @advertisement = assign(:advertisement, stub_model(Advertisement,
      :domain => "MyString",
      :pagename => "MyString",
      :seqnum => "MyString",
      :tagname => "MyString",
      :display_type => "MyString",
      :beizhu => "MyString"
    ))
  end

  it "renders the edit advertisement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => advertisements_path(@advertisement), :method => "post" do
      assert_select "input#advertisement_domain", :name => "advertisement[domain]"
      assert_select "input#advertisement_pagename", :name => "advertisement[pagename]"
      assert_select "input#advertisement_seqnum", :name => "advertisement[seqnum]"
      assert_select "input#advertisement_tagname", :name => "advertisement[tagname]"
      assert_select "input#advertisement_display_type", :name => "advertisement[display_type]"
      assert_select "input#advertisement_beizhu", :name => "advertisement[beizhu]"
    end
  end
end
