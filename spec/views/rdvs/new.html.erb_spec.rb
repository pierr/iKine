require 'spec_helper'

describe "rdvs/new.html.erb" do
  before(:each) do
    assign(:rdv, stub_model(Rdv,
      :lieu => "MyString",
      :contact => "MyString"
    ).as_new_record)
  end

  it "renders new rdv form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rdvs_path, :method => "post" do
      assert_select "input#rdv_lieu", :name => "rdv[lieu]"
      assert_select "input#rdv_contact", :name => "rdv[contact]"
    end
  end
end
