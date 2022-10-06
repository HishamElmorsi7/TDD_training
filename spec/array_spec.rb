require 'rspec'
require 'array'

describe 'uniq' do
    let(:array) { [1, 2, 1, 3, 3] }
    let(:uniq_arr) { uniq(array.dup) }

    it "doesn't have duplicates" do
        array.each do |ele|
            expect( uniq_arr.count(ele) ).to eq(1)
        end
    end

    it "doesn't have elements from outside the original array" do
        uniq_arr.each do |ele|
            expect(array).to include(ele)
        end
    end

    it "doesn't change the original array and results a new arr" do
        expect{ uniq(array) }.to_not change{ array }
    end

end

describe 'two_sums' do

    let(:arr){ [-1, 2, -2, 1] }
    let(:one_zero_arr) { [-1, 2, 0]}

    it 'finds all pairs of positions where the elements at those positions sum to zero' do
        expect(two_sum( arr )).to eq( [[0, 3], [1, 2]])
    end

    it "doesn't get confused by zeros" do
        expect(two_sum(one_zero_arr)).to eq([])
    end
end

describe 'my_transpose' do
    it 'will convert between the row-oriented and column-oriented representations' do
        rows = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ]

        cols = [
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8]
        ]

        expect(my_transpose(rows)).to eq(cols)
    end
end

describe 'stock_pick' do
    it 'takes an array of stock prices and outputs the most profitable days to first buy the stock and then sell the stock' do

        stock_price_per_days = { 'Day 0' => 1000, 'Day 1' => 500, 'Day 2' => 2000, 'Day 3' => 5000, 'Day 4' => 600, 'Day 5' => 7000, 'Day 6' => 3000 }
        expect(stock_pick(stock_price_per_days)).to eq(['Day 1', 'Day 5'])

    end

    it "doesn't by stock in crash" do
        stock_price_per_days = { 'Day 0' => 1000, 'Day 1' => 500, 'Day 2' => 2000, 'Day 3' => 5000, 'Day 4' => 600, 'Day 5' => 7000, 'Day 6' => 100 }
        expect(stock_pick(stock_price_per_days)).to be_nil
    end
end
