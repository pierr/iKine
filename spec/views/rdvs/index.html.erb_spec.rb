require 'spec_helper'

describe "rdvs/index.html.erb" do
  before(:each) do
    assign(:rdvs, [
      stub_model(Rdv,
        :lieu => "Lieu",
        :contact => "Contact"
      ),
      stub_model(Rdv,
        :lieu => "Lieu",
        :contact => "Contact"
      )
    ])
  end

  it "renders a list of rdvs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lieu".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
  end
end
