class Ad
  attr_accessor :size, :type, :lifespan, :cost, :start_date

  def initialize(size, type, lifespan, cost)
    @size = size
    @type = type
    @lifespan = lifespan
    @cost = cost
    @start_date = nil
  end

  def revenue(days_rem)
    return 0 if @start_date.nil?
    (@cost * (days_rem.to_f / @lifespan))
  end

  def set_start_date
    @start_date = Time.now.to_i
  end
end