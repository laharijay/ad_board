# if __FILE__ == $PROGRAM_NAME
require_relative "./ad_board"
require_relative "./ad_type"
require_relative"./ad"

 
ad_types = {
    "black_and_white" => AdType.new("black_and_white", 2),
    "color" => AdType.new("color", 8),
    "flashy" => AdType.new("flashy", 64)
  }
  
ad_board = AdBoard.new(5, 5)
ads = []
ad_types.values
(1..10).each do |_|
  ad_type = ad_types.values.sample
  ad_size = [1, 2, 4].sample
  ads << Ad.new(ad_size, ad_type.type, rand(1..10), ad_type.cost)
end

add_ads_to_board(ad_board, ads, 5)
p  revenue = ads[0].revenue(30)


ads_queue = []
