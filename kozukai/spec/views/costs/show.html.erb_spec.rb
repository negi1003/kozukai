require 'spec_helper'

describe "costs/show.html.erb" do
  before(:each) do
    @cost = assign(:cost, stub_model(Cost,
      :price => "Price",
      :subject => "Subject",
      :wday => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Price/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
