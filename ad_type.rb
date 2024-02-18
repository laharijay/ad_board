
class AdType
    attr_accessor :type, :cost
  
    def initialize(type, cost)
      @type = type
      @cost = cost
    end
  end
  
  ad_types = {
    "black_and_white" => AdType.new("black_and_white", 2),
    "color" => AdType.new("color", 8),
    "flashy" => AdType.new("flashy", 64)
  }
  
  def add_ads_to_board(ad_board, ads, num_ads)
    num_added = 0
    ads.each do |ad|
      if ad_board.add_ad(ad)
        puts "Added #{ad.type} ad of size #{ad.size}x#{ad.size}."
        num_added += 1
      end
      break if num_added == num_ads
    end
    puts "Can not add all ads." if num_added < num_ads
  end
  
  def replace_ads_with_max_revenue(ad_board, ads_queue)
    max_revenue = 0
    max_ad = nil
    ads_queue.each do |ad|
      days_rem = ad.lifespan - (Time.now.to_i - ad.start_date)
      revenue = ad.revenue(days_rem)
      if revenue > max_revenue
        max_revenue = revenue
        max_ad = ad
      end
    end
    return unless max_ad
  
    row, col = ad_board.available_space
    ad_board.remove_ad(row, col)
    ad_board.add_ad(max_ad)
    puts "Replaced ad with max revenue: #{max_ad.type} ad of size #{max_ad.size}x#{max_ad.size}."
  end
  
  