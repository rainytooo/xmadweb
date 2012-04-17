require 'spec_helper'

describe "student_timelines/edit" do
  before(:each) do
    @student_timeline = assign(:student_timeline, stub_model(StudentTimeline))
  end

  it "renders the edit student_timeline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => student_timelines_path(@student_timeline), :method => "post" do
    end
  end
end
