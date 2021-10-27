require 'rails_helper'

RSpec.describe "markers/new", type: :view do
  before(:each) do
    @u = double('user1', :id => 1, :username => "rogerio_satrah", :password => "senhasecretaK")
    assign(:marker, Marker.new(
      disaster_type: "",
      latitude: "9.99",
      longitude: "9.99",
      obs: "MyString",
      user: @u,
      upvotes: 1,
      downvotes: 1,
      verified: false
    ))
  end

  it "renders new marker form" do
    render

    assert_select "form[action=?][method=?]", markers_path, "post" do

      assert_select "input[name=?]", "marker[disaster_type]"

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
