require 'spec_helper'

describe "teaching_materials/index" do
  before(:each) do
    assign(:teaching_materials, [
      stub_model(TeachingMaterial),
      stub_model(TeachingMaterial)
    ])
  end

  it "renders a list of teaching_materials" do
    render
  end
end
