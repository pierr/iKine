require 'spec_helper'

describe "bilans/show.html.erb" do
  before(:each) do
    @bilan = assign(:bilan, stub_model(Bilan,
      :initial => "Initial",
      :intermediaire => "Intermediaire",
      :final => "Final"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Initial/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Intermediaire/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Final/)
  end
end
