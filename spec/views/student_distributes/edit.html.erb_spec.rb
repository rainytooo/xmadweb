require 'spec_helper'

describe "student_distributes/edit" do
  before(:each) do
    @student_distribute = assign(:student_distribute, stub_model(StudentDistribute))
  end

  it "renders the edit student_distribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => student_distributes_path(@student_distribute), :method => "post" do
    end
  end
end
