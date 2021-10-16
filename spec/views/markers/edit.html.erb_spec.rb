require 'rails_helper'

RSpec.describe "markers/edit", type: :view do
  before(:each) do
    @marker = assign(:marker, Marker.create!(
      type: "",
      latitude: "9.99",
      longitude: "9.99",
      obs: "MyString",
      user: nil,
      upvotes: 1,
      downvotes: 1,
      verified: false
    ))
  end

  it "renders the edit marker form" do
    render

    assert_select "form[action=?][method=?]", marker_path(@marker), "post" do

      assert_select "input[name=?]", "marker[type]"

      assert_select "input[name=?]", "marker[latitude]"

      assert_select "input[name=?]", "marker[longitude]"

      assert_select "input[name=?]", "marker[obs]"

      assert_select "input[name=?]", "marker[user_id]"

      assert_select "input[name=?]", "marker[upvotes]"

      assert_select "input[name=?]", "marker[downvotes]"

      assert_select "input[name=?]", "marker[verified]"
    end
  end
end
