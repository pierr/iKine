require 'spec_helper'

describe "bilans/index.html.erb" do
  before(:each) do
    assign(:bilans, [
      stub_model(Bilan,
        :initial => "Initial",
        :intermediaire => "Intermediaire",
        :final => "Final"
      ),
      stub_model(Bilan,
        :initial => "Initial",
        :intermediaire => "Intermediaire",
        :final => "Final"
      )
    ])
  end

  it "renders a list of bilans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Initial".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Intermediaire".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Final".to_s, :count => 2
  end
end
