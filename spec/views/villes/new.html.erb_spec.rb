require 'spec_helper'

describe "villes/new.html.erb" do
  before(:each) do
    assign(:ville, stub_model(Ville,
      :nom => "MyString"
    ).as_new_record)
  end

  it "renders new ville form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => villes_path, :method => "post" do
      assert_select "input#ville_nom", :name => "ville[nom]"
    end
  end
end
