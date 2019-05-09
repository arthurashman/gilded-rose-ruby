require 'gilded_rose'
require 'item'

describe GildedRose do

  describe '#update_quality' do
    context 'Updating a standard item while still in date' do
      it 'does not change the name' do
        items = [Item.new('foo', 2, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].name).to eq 'foo'
      end
      it 'updates the quality value' do
        items = [Item.new('foo', 2, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 9
      end
      it 'updates the sell in value' do
        items = [Item.new('foo', 2, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 1
      end
      it 'does not update the quality value below 0' do
        items = [Item.new('foo', 0, 1)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end
    end

    context 'Updating a standard item while not in date' do
      it 'updates the quality value' do
        items = [Item.new('foo', 0, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 8
      end
      it 'updates the sell in value' do
        items = [Item.new('foo', 0, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq -1
      end
      it 'does not update the quality value below 0' do
        items = [Item.new('foo', 0, 1)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end
    end

    context 'Updating Aged Brie' do
      it 'updates the quality value while in date' do
        items = [Item.new('Aged Brie', 2, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 11
      end
      it 'updates the quality value while out of date' do
        items = [Item.new('Aged Brie', 0, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 12
      end
      it 'does not update the quality value not past 50 when in date' do
        items = [Item.new('Aged Brie', 2, 50)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 50
      end
      it 'does not update the quality value not past 50 when out of date' do
        items = [Item.new('Aged Brie', 0, 50)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 50
      end
    end
    context 'Updating Sulfuras' do
      it 'does not update the quality value while in date' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 2, 80)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 80
      end
      it 'does not update the quality value while out of date' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 80
      end

      #Does Salfuras need a test for date changing?
    end
    context 'Updating Backstage passes' do
      it 'updates the quality value by 1 while over 10 days out' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 21
      end
      it 'updates the quality value by 2 while between 5 and 10 days out' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 22
      end
      it 'updates the quality value by 3 while between 1 and 5 days out' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 3, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 23
      end
      it 'updates the quality value to 0 after the concert' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', -1, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end
    end
  end
end
