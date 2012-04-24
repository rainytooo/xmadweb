require 'spec_helper'

describe "lessons/new" do
  before(:each) do
    assign(:lesson, stub_model(Lesson).as_new_record)
  end

  it "renders new lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path, :method => "post" do
    end
  end
end
