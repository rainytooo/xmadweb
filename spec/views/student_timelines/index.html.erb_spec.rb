require 'spec_helper'

describe "student_timelines/index" do
  before(:each) do
    assign(:student_timelines, [
      stub_model(StudentTimeline),
      stub_model(StudentTimeline)
    ])
  end

  it "renders a list of student_timelines" do
    render
  end
end
