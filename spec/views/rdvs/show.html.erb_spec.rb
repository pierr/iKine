require 'spec_helper'

describe "rdvs/show.html.erb" do
  before(:each) do
    @rdv = assign(:rdv, stub_model(Rdv,
      :lieu => "Lieu",
      :contact => "Contact"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Lieu/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact/)
  end
end
