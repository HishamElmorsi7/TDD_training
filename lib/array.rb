def uniq(arr)

    uniq_arr = []
    arr.each do |ele|
        uniq_arr << ele unless uniq_arr.include?(ele)
    end

    uniq_arr
end

def two_sum(arr)
    two_sum_pairs = []
    arr.each_with_index do |ele1, i1|
        arr.each_with_index do |ele2, i2|
            two_sum_pairs << [i1, i2] if ele1 + ele2 == 0 && i1 != i2
        end
    end

    # I have repeated pair and here I remove them
    limit_end =  two_sum_pairs.length / 2 - 1
    two_sum_pairs[ 0.. limit_end]
end

def my_transpose(arr)
    cols = []

    arr.each_with_index do |row, i|
        new_row = []
        row.each_with_index do |ele, j|
            new_row << arr[j][i]
        end
        cols << new_row
    end

    cols
end

# stock picker method

def stock_pick(price_per_days)

    lowest_price = Float::INFINITY
    highest_price = 0

    lowest_price_day = ''
    highest_price_day = ''

    price_per_days.each do |key, val|
        if( val < lowest_price )
            lowest_price = val
            lowest_price_day = key
        end

        if( val >= highest_price )
            highest_price = val
            highest_price_day = key
        end
    end

    return nil if lowest_price_day == price_per_days.keys.last

    [lowest_price_day, highest_price_day]
end