class RedditHotCalculator
  EPOCH = Time.local(1999, 1, 1, 1, 1, 1).to_time

  def initialize(downs, ups, date)
    @ups = ups
    @downs = downs
    @date = date
  end

  def epoch_seconds
    (@date.to_i - EPOCH.to_i).to_f
  end

  def displacement
    Math.log([difference.abs, 1].max, 10)
  end

  def difference
    @ups - @downs
  end

  def sign
    return 1 if difference > 0
    return -1 if difference < 0
    return 0
  end

  # date is a ruby Time
  def hot
    return ((displacement * sign.to_f) + (epoch_seconds / 45000))
  end

end