require 'spec_helper'

describe "word_child_categories/index" do
  before(:each) do
    assign(:word_child_categories, [
      stub_model(WordChildCategory,
        :word_category_id => 1,
        :title => "Title",
        :desc => "MyText"
      ),
      stub_model(WordChildCategory,
        :word_category_id => 1,
        :title => "Title",
        :desc => "MyText"
      )
    ])
  end

  it "renders a list of word_child_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
