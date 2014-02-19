class Scoreboard
  attr_reader :date, :upvotes, :downvotes

  def initialize(args = {})
    @date       = args[:created_at] || Time.now
    @upvotes    = args[:votes_up]   || 0
    @downvotes  = args[:votes_down] || 0
  end

  def result
    calculator(upvotes, downvotes, date)
  end

  def calculator(upvotes, downvotes, created_date)
    (displacement * sign.to_f) + ( epoch_seconds(created_date) / 45000 )
  end

  def displacement
    Math.log( [difference.abs, 1].max , 10 )
  end

  def sign
    return 1 if difference > 0
    return -1 if difference < 0
    return 0 if difference == 0
  end

  def difference
    (upvotes - downvotes)
  end

private

  def our_epoch
    @our_epoch ||= Time.local(1984, 12, 9, 7, 46, 43).to_time
  end

  def epoch_seconds(time)
    @epoch_seconds ||= (time.to_i - our_epoch.to_i).to_f
  end
end
