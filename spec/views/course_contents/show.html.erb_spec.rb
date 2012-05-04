require 'spec_helper'

describe "course_contents/show" do
  before(:each) do
    @course_content = assign(:course_content, stub_model(CourseContent))
  end

  it "renders attributes in <p>" do
    render
  end
end
