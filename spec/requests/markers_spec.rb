 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/markers", type: :request do
  
  # Marker. As you add validations to Marker, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Marker.create! valid_attributes
      get markers_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      marker = Marker.create! valid_attributes
      get marker_url(marker)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_marker_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      marker = Marker.create! valid_attributes
      get edit_marker_url(marker)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Marker" do
        expect {
          post markers_url, params: { marker: valid_attributes }
        }.to change(Marker, :count).by(1)
      end

      it "redirects to the created marker" do
        post markers_url, params: { marker: valid_attributes }
        expect(response).to redirect_to(marker_url(Marker.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Marker" do
        expect {
          post markers_url, params: { marker: invalid_attributes }
        }.to change(Marker, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post markers_url, params: { marker: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested marker" do
        marker = Marker.create! valid_attributes
        patch marker_url(marker), params: { marker: new_attributes }
        marker.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the marker" do
        marker = Marker.create! valid_attributes
        patch marker_url(marker), params: { marker: new_attributes }
        marker.reload
        expect(response).to redirect_to(marker_url(marker))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        marker = Marker.create! valid_attributes
        patch marker_url(marker), params: { marker: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested marker" do
      marker = Marker.create! valid_attributes
      expect {
        delete marker_url(marker)
      }.to change(Marker, :count).by(-1)
    end

    it "redirects to the markers list" do
      marker = Marker.create! valid_attributes
      delete marker_url(marker)
      expect(response).to redirect_to(markers_url)
    end
  end
end
