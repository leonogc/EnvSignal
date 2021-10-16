require 'rails_helper'

RSpec.describe "markers/show", type: :view do
  before(:each) do
    @marker = assign(:marker, Marker.create!(
      type: "Type",
      latitude: "9.99",
      longitude: "9.99",
      obs: "Obs",
      user: nil,
      upvotes: 2,
      downvotes: 3,
      verified: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Obs/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
  end
end
