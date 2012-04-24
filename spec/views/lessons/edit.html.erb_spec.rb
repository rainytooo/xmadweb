require 'spec_helper'

describe "lessons/edit" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson))
  end

  it "renders the edit lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path(@lesson), :method => "post" do
    end
  end
end
