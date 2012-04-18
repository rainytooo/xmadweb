require 'spec_helper'

describe "student_distributes/new" do
  before(:each) do
    assign(:student_distribute, stub_model(StudentDistribute).as_new_record)
  end

  it "renders new student_distribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => student_distributes_path, :method => "post" do
    end
  end
end
