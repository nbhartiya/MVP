require 'spec_helper'

describe "profiles/show" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :blurb => "MyText",
      :location_id => 1,
      :story => "MyText",
      :home_zip => "Home Zip",
      :work_zip => "Work Zip"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/Home Zip/)
    rendered.should match(/Work Zip/)
  end
end
