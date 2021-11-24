require 'rails_helper'

RSpec.describe MarkersHelper, type: :helper do
    it 'Mesmo lugar' do
        expect(helper.calculateDistance('0','0','0','0')).to eq(0.00)
    end

    it 'Calcula distancia' do
        expect(helper.calculateDistance('26.1232','-23.3323','-23.4823919','-46.5004498')).to eq(6052.83)
    end
end