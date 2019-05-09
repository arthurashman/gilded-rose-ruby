require 'gilded_rose'
require 'item'

describe GildedRose do

  describe '#update_quality' do
    context 'Updating a standard item while still in git c' do
      it 'does not change the name' do
        items = [Item.new('foo', 2, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].name).to eq 'foo'
      end
      it 'updates the quality value' do
        items = [Item.new('foo', 2, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 9
      end
      it 'updates the sell in value' do
        items = [Item.new('foo', 2, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 1
      end
    end
  end
end
