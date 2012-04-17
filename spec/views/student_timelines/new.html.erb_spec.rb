require 'spec_helper'

describe "student_timelines/new" do
  before(:each) do
    assign(:student_timeline, stub_model(StudentTimeline).as_new_record)
  end

  it "renders new student_timeline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => student_timelines_path, :method => "post" do
    end
  end
end
