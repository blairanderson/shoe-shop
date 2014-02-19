require 'spec_helper'

describe Scoreboard do
  let(:target_post) do
    {
      votes_down: 0,
      votes_up: 0,
      created_at: Time.now
    }
  end
  let(:scoreboard) { Scoreboard.new(target_post) }
    
  it 'should be a kind of scoreboard' do
    scoreboard.should be_kind_of Scoreboard
  end
  
  describe '#date' do
    it 'should return the posts created_at date' do
      scoreboard.date.should eq target_post[:created_at]
    end
  end

  describe '#upvotes' do
    it 'should return the total upvotes for the post' do
      scoreboard.upvotes.should eq target_post[:votes_up]
    end
  end

  describe '#downvotes' do
    it 'should return the total downvotes for the post' do
      scoreboard.downvotes.should eq target_post[:votes_down]
    end
  end

  describe '#difference' do
    it 'should return the upvotes minus the downvotes' do
      scoreboard.stub(:upvotes).and_return(10)
      scoreboard.stub(:downvotes).and_return(5)
      scoreboard.difference.should eq 5
    end
  end

  describe '#displacement' do
    it 'should eq some math shit based on the difference' do
      target_number = 5
      scoreboard.stub(:difference).and_return(target_number)
      solution = Math.log( [target_number.abs, 1].max,  10 )
      scoreboard.displacement.should eq solution
    end
  end

  describe '#sign' do
    it 'should return 1 if upvotes is higher than downvotes' do
      scoreboard.stub(:upvotes).and_return(1)
      scoreboard.stub(:downvotes).and_return(0)
      scoreboard.sign.should eq 1
    end

    it 'should return 0 if upvotes are equal to downvotes' do
      scoreboard.stub(:upvotes).and_return(1)
      scoreboard.stub(:downvotes).and_return(1)
      scoreboard.sign.should eq 0
    end

    it 'should return -1 if upvotes is lower than downvotes' do
      scoreboard.stub(:upvotes).and_return(0)
      scoreboard.stub(:downvotes).and_return(1)
      scoreboard.sign.should eq -1
    end
  end

  describe '#result' do
    let(:new_high_ranking_post) { OpenStruct.new(cached_votes_down: 1, cached_votes_up: 300)}
    let(:new_high_scoreboard) { Scoreboard.new(:post => new_high_ranking_post) }

    let(:old_high_ranking_post) { OpenStruct.new(created_at: 1.week.ago, cached_votes_down: 1, cached_votes_up: 300)}
    let(:old_high_scoreboard) { Scoreboard.new(:post => old_high_ranking_post) }

    it 'new high score should be higher than an old high score' do
      new_high_scoreboard.result.should be > old_high_scoreboard.result
      new_high_scoreboard.result.should be > 20190
      old_high_scoreboard.result.should be > 20149
    end

    let(:older_high_ranking_post) { OpenStruct.new(created_at: 15.months.ago, cached_votes_down: 2, cached_votes_up: 302)}
    let(:older_high_scoreboard) { Scoreboard.new(:post => older_high_ranking_post) }
    it 'older high score should be lower than old high score' do
      old_high_scoreboard.result.should be > older_high_scoreboard.result
      old_high_scoreboard.result.should be > 20149
      older_high_scoreboard.result.should be > 19312
    end

    let(:new_mid_ranking_post) { OpenStruct.new(cached_votes_up: 1000, cached_votes_down: 900)}
    let(:new_mid_scoreboard) { Scoreboard.new(:post => new_mid_ranking_post) }

    it 'new high score should be higher than a mid score' do
      new_high_scoreboard.result.should be > new_mid_scoreboard.result
      new_high_scoreboard.result.should be > 20190
      new_mid_scoreboard.result.should be > 20189
    end

    let(:new_low_ranking_post) { OpenStruct.new(cached_votes_down: 100, cached_votes_up: 3)}
    let(:new_low_scoreboard) { Scoreboard.new(:post => new_low_ranking_post) }

    it 'new mid score should be higher than new low score' do
      new_mid_scoreboard.result.should be > new_low_scoreboard.result
    end

    it 'should change when a post has a new vote' do
      first_result = scoreboard.result
      first_result.should be > 0 

      scoreboard.stub(:upvotes).and_return(10)
      second_result = scoreboard.result 

      second_result.should be > first_result
    end
  end
end
