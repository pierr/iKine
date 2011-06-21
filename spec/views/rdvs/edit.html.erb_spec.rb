require 'spec_helper'

describe "rdvs/edit.html.erb" do
  before(:each) do
    @rdv = assign(:rdv, stub_model(Rdv,
      :lieu => "MyString",
      :contact => "MyString"
    ))
  end

  it "renders the edit rdv form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rdvs_path(@rdv), :method => "post" do
      assert_select "input#rdv_lieu", :name => "rdv[lieu]"
      assert_select "input#rdv_contact", :name => "rdv[contact]"
    end
  end
end
