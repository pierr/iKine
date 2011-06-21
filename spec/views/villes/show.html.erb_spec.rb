require 'spec_helper'

describe "villes/show.html.erb" do
  before(:each) do
    @ville = assign(:ville, stub_model(Ville,
      :nom => "Nom"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nom/)
  end
end
