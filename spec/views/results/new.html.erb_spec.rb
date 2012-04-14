require 'spec_helper'

describe "results/new" do
  before(:each) do
    assign(:result, stub_model(Result).as_new_record)
  end

  it "renders new result form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => results_path, :method => "post" do
    end
  end
end
