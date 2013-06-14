require 'spec_helper'

describe "profiles/index" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :blurb => "MyText",
        :location_id => 1,
        :story => "MyText",
        :home_zip => "Home Zip",
        :work_zip => "Work Zip"
      ),
      stub_model(Profile,
        :blurb => "MyText",
        :location_id => 1,
        :story => "MyText",
        :home_zip => "Home Zip",
        :work_zip => "Work Zip"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Home Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Work Zip".to_s, :count => 2
  end
end
