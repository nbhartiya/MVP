require 'spec_helper'

describe "profiles/new" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :blurb => "MyText",
      :location_id => 1,
      :story => "MyText",
      :home_zip => "MyString",
      :work_zip => "MyString"
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profiles_path, "post" do
      assert_select "textarea#profile_blurb[name=?]", "profile[blurb]"
      assert_select "input#profile_location_id[name=?]", "profile[location_id]"
      assert_select "textarea#profile_story[name=?]", "profile[story]"
      assert_select "input#profile_home_zip[name=?]", "profile[home_zip]"
      assert_select "input#profile_work_zip[name=?]", "profile[work_zip]"
    end
  end
end
