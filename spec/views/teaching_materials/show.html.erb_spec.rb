require 'spec_helper'

describe "teaching_materials/show" do
  before(:each) do
    @teaching_material = assign(:teaching_material, stub_model(TeachingMaterial))
  end

  it "renders attributes in <p>" do
    render
  end
end
