require 'rspec'
require './bowling_game.rb'

describe Game do

  before do
    @game = Game.new
  end

  def roll_many(n, pins)
    n.times{ @game.roll(pins) }
  end
  
  def roll_spare
    @game.roll(5)
    @game.roll(5)
  end

  def roll_strike
    @game.roll(10)
  end

  describe "When the game become Gutter Game" do
    it 'should be score 0' do
      roll_many(20, 0)
      @game.score.should eq 0
    end
  end

  describe "When all rolls become 1" do
    it 'should be score 20' do
      roll_many(20, 1)
      @game.score.should eq 20
    end
  end

  describe "When the game have 1 spare" do
    it 'should be score 16' do
      roll_spare
      @game.roll(3)
      roll_many(17, 0)
      @game.score.should eq 16
    end
  end

  describe "When the game have 1 strike" do
    it 'should be score 24' do
      roll_strike 
      @game.roll(3)
      @game.roll(4)
      roll_many(16, 0)
      @game.score.should eq 24
    end
  end

  describe "When the game is perfect" do
    it 'should be score 300' do
      12.times { roll_strike }
      @game.score.should eq 300
    end
  end

end
