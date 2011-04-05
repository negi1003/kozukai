require 'spec_helper'

describe "costs/new.html.erb" do
  before(:each) do
    assign(:cost, stub_model(Cost,
      :price => "MyString",
      :subject => "MyString",
      :wday => 1
    ).as_new_record)
  end

  it "renders new cost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => costs_path, :method => "post" do
      assert_select "input#cost_price", :name => "cost[price]"
      assert_select "input#cost_subject", :name => "cost[subject]"
      assert_select "input#cost_wday", :name => "cost[wday]"
    end
  end
end
