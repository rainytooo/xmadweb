require 'spec_helper'

describe "teaching_materials/edit" do
  before(:each) do
    @teaching_material = assign(:teaching_material, stub_model(TeachingMaterial))
  end

  it "renders the edit teaching_material form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teaching_materials_path(@teaching_material), :method => "post" do
    end
  end
end
