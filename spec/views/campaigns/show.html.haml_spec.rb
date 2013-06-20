require 'spec_helper'

describe "campaigns/show" do
  before(:each) do
    @campaign = assign(:campaign, stub_model(Campaign,
      :bus_name => "Bus Name",
      :blurb => "MyText",
      :about => "MyText",
      :why_join => "MyText",
      :location_id => 1,
      :foodie_id => 2,
      :host_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Bus Name/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
