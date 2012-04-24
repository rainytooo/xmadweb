require 'spec_helper'

describe "lessons/index" do
  before(:each) do
    assign(:lessons, [
      stub_model(Lesson),
      stub_model(Lesson)
    ])
  end

  it "renders a list of lessons" do
    render
  end
end
