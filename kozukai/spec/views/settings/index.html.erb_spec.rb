require 'spec_helper'

describe "settings/index.html.erb" do
  before(:each) do
    assign(:settings, [
      stub_model(Setting,
        :cutoff_date => 1,
        :user_id => 1
      ),
      stub_model(Setting,
        :cutoff_date => 1,
        :user_id => 1
      )
    ])
  end

  it "renders a list of settings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
