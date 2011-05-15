require 'spec_helper'

describe "settings/new.html.erb" do
  before(:each) do
    assign(:setting, stub_model(Setting,
      :cutoff_date => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => settings_path, :method => "post" do
      assert_select "input#setting_cutoff_date", :name => "setting[cutoff_date]"
      assert_select "input#setting_user_id", :name => "setting[user_id]"
    end
  end
end
