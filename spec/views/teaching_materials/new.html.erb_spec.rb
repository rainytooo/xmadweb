require 'spec_helper'

describe "teaching_materials/new" do
  before(:each) do
    assign(:teaching_material, stub_model(TeachingMaterial).as_new_record)
  end

  it "renders new teaching_material form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teaching_materials_path, :method => "post" do
    end
  end
end
