require 'rails_helper'

RSpec.describe AuthoritiesHelper, type: helper do
    it 'Mesmo lugar' do
        dist = calculateDistance(0,0,0,0) 
        expect(dist).to eq(0)
    end

    it 'Calcula distancia' do
        dist = calculateDistance(26.1232,-23.3323,-23.4823919,-46.5004498) 
        expect(dist).to eq(6052.83)
    end
end