require 'spec_helper'

describe "bilans/edit.html.erb" do
  before(:each) do
    @bilan = assign(:bilan, stub_model(Bilan,
      :initial => "MyString",
      :intermediaire => "MyString",
      :final => "MyString"
    ))
  end

  it "renders the edit bilan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bilans_path(@bilan), :method => "post" do
      assert_select "input#bilan_initial", :name => "bilan[initial]"
      assert_select "input#bilan_intermediaire", :name => "bilan[intermediaire]"
      assert_select "input#bilan_final", :name => "bilan[final]"
    end
  end
end
