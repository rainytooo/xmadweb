require 'spec_helper'

describe "results/show" do
  before(:each) do
    @result = assign(:result, stub_model(Result))
  end

  it "renders attributes in <p>" do
    render
  end
end
