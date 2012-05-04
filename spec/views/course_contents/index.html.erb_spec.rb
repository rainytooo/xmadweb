require 'spec_helper'

describe "course_contents/index" do
  before(:each) do
    assign(:course_contents, [
      stub_model(CourseContent),
      stub_model(CourseContent)
    ])
  end

  it "renders a list of course_contents" do
    render
  end
end
