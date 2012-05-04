require 'spec_helper'

describe "course_contents/new" do
  before(:each) do
    assign(:course_content, stub_model(CourseContent).as_new_record)
  end

  it "renders new course_content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => course_contents_path, :method => "post" do
    end
  end
end
