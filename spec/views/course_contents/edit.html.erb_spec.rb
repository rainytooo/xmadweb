require 'spec_helper'

describe "course_contents/edit" do
  before(:each) do
    @course_content = assign(:course_content, stub_model(CourseContent))
  end

  it "renders the edit course_content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => course_contents_path(@course_content), :method => "post" do
    end
  end
end
