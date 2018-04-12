require 'pry'
require './shopify'
require './lib/product'

RSpec.describe Shopify::Product do
  describe '.all' do
    it 'return ...' do
      expected = Shopify::GET_PRODUCTS.count

      expect(described_class.all.count).to eq(expected)
    end
  end

  describe '.find' do
    it 'return expected title' do
      expect(described_class.find(2).title).to eq('Shampoing Solide Démêlant - Sweetie')
    end

    context 'Invalid param' do
      it 'return TypeError with invalid type param' do
        expect { described_class.find('2') }.to raise_error(TypeError)
      end
    end
  end

  describe '.where' do
    it 'return expected id' do
      expect(described_class.where(:title, 'Gel douche Monoï').first.id).to eq(1)
    end
  end
end
