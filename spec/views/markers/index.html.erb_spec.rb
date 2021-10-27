require 'rails_helper'

RSpec.describe "markers/index", type: :view do
  before(:each) do
    @u = double('user1', :id => 1, :username => "rogerio_satrah", :password => "senhasecretaK")
    assign(:markers, [
      Marker.create!(
        disaster_type: "Type",
        latitude: "9.99",
        longitude: "9.99",
        obs: "Obs",
        user: @u,
        upvotes: 2,
        downvotes: 3,
        verified: false
      ),
      Marker.create!(
        disaster_type: "Type",
        latitude: "9.99",
        longitude: "9.99",
        obs: "Obs",
        user: @u,
        upvotes: 2,
        downvotes: 3,
        verified: false
      )
    ])
  end

  it "renders a list of markers" do
    render
    assert_select "tr>td", text: "Type".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "Obs".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
