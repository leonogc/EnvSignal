require 'rails_helper'
require 'spec_helper'

RSpec.describe Marker, type: :model do
  describe "registro marker" do

    before :all do
      user3 = User.new(name: "Roge",username: "roge", email: "roge@gmail.com",birth_date: Date.parse("17/11/1990"),password: "senhasecretaK").save
      authority1 = Authority.new(identifier: 194, name: "Corpo de Bombas", password: "SenhaDosBombasTeste").save
    end
    it 'Funciona - Usuário' do
      @user = User.order("id").last
      marker = Marker.new
      marker.user_id = @user.id
      marker.disaster_type = "vazamento"
      marker.latitude = 25.2362
      marker.longitude = -27.8883
      marker.obs = "Fogo!"
      marker.user_type = 0
      expect(marker).to be_valid
    end
    it 'Funciona - Autoridade' do
      @authority = Authority.order("id").last
      marker = Marker.new
      marker.user_id = @authority.identifier
      marker.disaster_type = "vazamento"
      marker.latitude = 25.2362
      marker.longitude = -27.8883
      marker.obs = "Fogo!"
      marker.user_type = 1
      expect(marker).to be_valid
    end
    it 'Sem usuário' do
      marker = Marker.new
      marker.disaster_type = "vazamento"
      marker.latitude = 25.2362
      marker.longitude = -27.8883
      marker.obs = "Fogo!"
      marker.user_type = 0
      expect(marker).not_to be_valid
    end
    it 'Sem disaster_type' do
      @user = User.order("id").last
      marker = Marker.new
      marker.user_id = @user.id
      marker.latitude = 25.2362
      marker.longitude = -27.8883
      marker.obs = "Fogo!"
      marker.user_type = 0
      expect(marker).not_to be_valid
    end
    it 'Usuário não existe' do
      marker = Marker.new
      marker.user_id = -1
      marker.disaster_type = "vazamento"
      marker.latitude = 25.2362
      marker.longitude = -27.8883
      marker.obs = "Fogo!"
      marker.user_type = 0
      expect(marker).not_to be_valid
    end
    it 'Autoridade não existe' do
      marker = Marker.new
      marker.user_id = -1
      marker.disaster_type = "vazamento"
      marker.latitude = 25.2362
      marker.longitude = -27.8883
      marker.obs = "Fogo!"
      marker.user_type = 1
      expect(marker).not_to be_valid
    end
    it 'Sem latitude' do
      @user = User.order("id").last
      marker = Marker.new
      marker.user_id = @user.id
      marker.disaster_type = "vazamento"
      marker.longitude = -27.8883
      marker.obs = "Fogo!"
      marker.user_type = 0
      expect(marker).not_to be_valid
    end
    it 'Sem longitude' do
      @user = User.order("id").last
      marker = Marker.new
      marker.user_id = @user.id
      marker.disaster_type = "vazamento"
      marker.latitude = 25.2362
      marker.obs = "Fogo!"
      marker.user_type = 0
      expect(marker).not_to be_valid
    end
    it 'Sem User_Type' do
      @user = User.order("id").last
      marker = Marker.new
      marker.user_id = @user.id
      marker.disaster_type = "vazamento"
      marker.latitude = 25.2362
      marker.obs = "Fogo!"
      expect(marker).not_to be_valid
    end
    it "has no votes" do
      @user = User.order("id").last
      marker = Marker.new
      marker.user_id = @user.id
      marker.disaster_type = "vazamento"
      marker.latitude = 25.2362
      marker.longitude = -27.8883
      marker.obs = "Fogo!"
      marker.user_type = 0
      expect(marker.upvotes).to eq(0)
      expect(marker.downvotes).to eq(0)
    end
  end
end
