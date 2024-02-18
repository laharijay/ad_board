class AdBoard
    attr_accessor :board
  
    def initialize(n, m)
      @board = Array.new(n) { Array.new(m) { nil } }
    end
  
    def add_ad(ad)
      row, col = available_space
      return false if row.nil? || col.nil?
  
      @board[row][col] = ad
      ad.set_start_date
      true
    end
  
    def remove_ad(row, col)
      @board[row][col] = nil
      true
    end
  
    def available_space
      @board.each_with_index do |row, i|
        row.each_with_index do |cell, j|
          return [i, j] if cell.nil?
        end
      end
      [nil, nil]
    end
  end
  