require 'item'
require 'gilded_rose'

describe Item do
  describe '#to_s' do
    it 'formats item output' do
      mongoose_elixir = Item.new(name='Elixir of the Mongoose', sell_in=5, quality=7)
      expect(mongoose_elixir.to_s).to eq('Elixir of the Mongoose, 5, 7')
    end
  end
end
