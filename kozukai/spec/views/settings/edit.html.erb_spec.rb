require 'spec_helper'

describe "settings/edit.html.erb" do
  before(:each) do
    @setting = assign(:setting, stub_model(Setting,
      :cutoff_date => 1,
      :user_id => 1
    ))
  end

  it "renders the edit setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => settings_path(@setting), :method => "post" do
      assert_select "input#setting_cutoff_date", :name => "setting[cutoff_date]"
      assert_select "input#setting_user_id", :name => "setting[user_id]"
    end
  end
end
