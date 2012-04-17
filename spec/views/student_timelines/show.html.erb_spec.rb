require 'spec_helper'

describe "student_timelines/show" do
  before(:each) do
    @student_timeline = assign(:student_timeline, stub_model(StudentTimeline))
  end

  it "renders attributes in <p>" do
    render
  end
end
