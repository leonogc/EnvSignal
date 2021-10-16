require "rails_helper"

RSpec.describe MarkersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/markers").to route_to("markers#index")
    end

    it "routes to #new" do
      expect(get: "/markers/new").to route_to("markers#new")
    end

    it "routes to #show" do
      expect(get: "/markers/1").to route_to("markers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/markers/1/edit").to route_to("markers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/markers").to route_to("markers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/markers/1").to route_to("markers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/markers/1").to route_to("markers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/markers/1").to route_to("markers#destroy", id: "1")
    end
  end
end
