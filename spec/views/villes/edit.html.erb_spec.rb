require 'spec_helper'

describe "villes/edit.html.erb" do
  before(:each) do
    @ville = assign(:ville, stub_model(Ville,
      :nom => "MyString"
    ))
  end

  it "renders the edit ville form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => villes_path(@ville), :method => "post" do
      assert_select "input#ville_nom", :name => "ville[nom]"
    end
  end
end
