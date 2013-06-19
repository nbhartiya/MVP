require 'spec_helper'

describe "campaigns/index" do
  before(:each) do
    assign(:campaigns, [
      stub_model(Campaign,
        :bus_name => "Bus Name",
        :blurb => "MyText",
        :about => "MyText",
        :why_join => "MyText",
        :location_id => 1,
        :foodie_id => 2,
        :host_id => 3
      ),
      stub_model(Campaign,
        :bus_name => "Bus Name",
        :blurb => "MyText",
        :about => "MyText",
        :why_join => "MyText",
        :location_id => 1,
        :foodie_id => 2,
        :host_id => 3
      )
    ])
  end

  it "renders a list of campaigns" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bus Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
