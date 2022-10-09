class TowerOfHanoi
    attr_reader :towers

    def initialize
        @towers = { 0 => [3, 2, 1], 1 => [], 2 => []}
    end

    def play

        until won?
            display()

            puts "which tower you want to move from?"
            from_tower = gets.chomp.to_i
            puts "which tower you want to move onto?"
            target_tower = gets.chomp.to_i

            if valid_move?(from_tower, target_tower)
                move(from_tower, target_tower)
            else
                puts("Invalid move, please try again")
                sleep(1)
            end
        end

        puts "Congratulations you won!"
    end

    def render
        #arr of string discs
        towers_discs = getDisks()

        "tower 0 : "  + towers_discs[0] + "\n" +
        "tower 1 : "  + towers_discs[1] + "\n" +
        "tower 2 : "  + towers_discs[2] + "\n"

    end

    def move(from_tower, target_tower)

        raise("can't move from a blank space") if towers[from_tower].empty?
        raise("can't move to a smaller disc") if !valid_move?(from_tower, target_tower)

        towers[target_tower] << towers[from_tower].pop

    end

    def won?
        towers[0].empty? && ( towers[1].empty? || towers[2].empty? )
    end

    private
    # gets string of discs per each tower
    def getDisks
        joined_discs_per_each_tower = []
        countOfTowers = towers.count

        countOfTowers.times do |countNum|
            joined_discs_per_each_tower << towers[countNum].join(" ")
        end

        joined_discs_per_each_tower
    end

    def valid_move?(from_tower, target_tower)
        return false unless [from_tower, target_tower].all? { |i| i.between?(0, 2) }

        !towers[from_tower].empty? && (
            towers[target_tower].empty? ||
            towers[target_tower].last > towers[from_tower].last
        )
    end

    def display
        system('clear')
        puts render
    end

end