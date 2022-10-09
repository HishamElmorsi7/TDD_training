require 'rspec'
require 'tower_of_hanoi'


describe TowerOfHanoi do
    subject(:towerOfHanoi) { TowerOfHanoi.new}

    describe '#initialize' do
        it 'creates a game with towers and discs' do
            expect(towerOfHanoi.towers).to eq({ 0 => [3, 2, 1], 1 => [], 2 => [] })
        end
    end


    describe '#render' do
        it 'pretty prints stacks' do
            expect(towerOfHanoi.render).to eq("tower 0 : 3 2 1\ntower 1 : \ntower 2 : \n")
        end

        it 'prints shorter stacks' do
            towerOfHanoi.move(0, 2)
            towerOfHanoi.move(0, 1)
            expect(towerOfHanoi.render).to eq("tower 0 : 3\ntower 1 : 2\ntower 2 : 1\n")
        end
    end


    describe '#move' do
        it 'allows moving to a blank space' do
            expect { towerOfHanoi.move(0, 1) }.not_to raise_error
        end

        it 'allows moving to a larger disc' do
            towerOfHanoi.move(0, 2)
            towerOfHanoi.move(0, 1)
            expect { towerOfHanoi.move(2, 1) }.not_to raise_error
        end

        it "doesn't allow moving from a blank space" do
            expect{ towerOfHanoi.move(1, 0) }.to raise_error("can't move from a blank space")
        end

        it "doesn't allow moving to a smaller disc" do
            towerOfHanoi.move(0, 1)
            expect { towerOfHanoi.move(0, 1) }.to raise_error("can't move to a smaller disc")
        end
    end


    describe '#won?' do
        it 'is not won at the beginning of the game' do
            expect(towerOfHanoi).not_to be_won
        end

        it 'is won when all discs are moved to tower 1' do
            # moves to win the game
            towerOfHanoi.move(0, 1)
            towerOfHanoi.move(0, 2)
            towerOfHanoi.move(1, 2)
            towerOfHanoi.move(0, 1)
            towerOfHanoi.move(2, 0)
            towerOfHanoi.move(2, 1)
            towerOfHanoi.move(0, 1)

            expect(towerOfHanoi).to be_won
        end

        it 'is won when all discs are moved to tower 2' do

            # Perform the moves to move the game into winning position
            towerOfHanoi.move(0, 2)
            towerOfHanoi.move(0, 1)
            towerOfHanoi.move(2, 1)
            towerOfHanoi.move(0, 2)
            towerOfHanoi.move(1, 0)
            towerOfHanoi.move(1, 2)
            towerOfHanoi.move(0, 2)

            expect(towerOfHanoi).to be_won
        end
    end
end