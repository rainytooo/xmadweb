require 'spec_helper'

describe "advertisements/new" do
  before(:each) do
    assign(:advertisement, stub_model(Advertisement,
      :domain => "MyString",
      :pagename => "MyString",
      :seqnum => "MyString",
      :tagname => "MyString",
      :display_type => "MyString",
      :beizhu => "MyString"
    ).as_new_record)
  end

  it "renders new advertisement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => advertisements_path, :method => "post" do
      assert_select "input#advertisement_domain", :name => "advertisement[domain]"
      assert_select "input#advertisement_pagename", :name => "advertisement[pagename]"
      assert_select "input#advertisement_seqnum", :name => "advertisement[seqnum]"
      assert_select "input#advertisement_tagname", :name => "advertisement[tagname]"
      assert_select "input#advertisement_display_type", :name => "advertisement[display_type]"
      assert_select "input#advertisement_beizhu", :name => "advertisement[beizhu]"
    end
  end
end
