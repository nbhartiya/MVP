require 'spec_helper'

describe "campaigns/new" do
  before(:each) do
    assign(:campaign, stub_model(Campaign,
      :bus_name => "MyString",
      :blurb => "MyText",
      :about => "MyText",
      :why_join => "MyText",
      :location_id => 1,
      :foodie_id => 1,
      :host_id => 1
    ).as_new_record)
  end

  it "renders new campaign form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", campaigns_path, "post" do
      assert_select "input#campaign_bus_name[name=?]", "campaign[bus_name]"
      assert_select "textarea#campaign_blurb[name=?]", "campaign[blurb]"
      assert_select "textarea#campaign_about[name=?]", "campaign[about]"
      assert_select "textarea#campaign_why_join[name=?]", "campaign[why_join]"
      assert_select "input#campaign_location_id[name=?]", "campaign[location_id]"
      assert_select "input#campaign_foodie_id[name=?]", "campaign[foodie_id]"
      assert_select "input#campaign_host_id[name=?]", "campaign[host_id]"
    end
  end
end
