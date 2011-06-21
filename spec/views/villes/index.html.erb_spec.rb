require 'spec_helper'

describe "villes/index.html.erb" do
  before(:each) do
    assign(:villes, [
      stub_model(Ville,
        :nom => "Nom"
      ),
      stub_model(Ville,
        :nom => "Nom"
      )
    ])
  end

  it "renders a list of villes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
  end
end
