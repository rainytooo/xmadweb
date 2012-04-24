require 'spec_helper'

describe "lessons/show" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson))
  end

  it "renders attributes in <p>" do
    render
  end
end
