require_relative '../../../spec_helper'
require 'set'

describe "ImmutableSet#divide" do
  it "divides self into a set of subsets based on the blocks return values" do
    set = ImmutableSet["one", "two", "three", "four", "five"].divide { |x| x.length }
    set.map { |x| x.to_a }.to_a.sort.should == [["five", "four"], ["one", "two"], ["three"]]
  end

  it "yields each Object in self in sorted order" do
    ret = []
    ImmutableSet["one", "two", "three", "four", "five"].divide { |x| ret << x }
    ret.should == ["one", "two", "three", "four", "five"].sort
  end

  # BUG: Does not raise a LocalJumpError, but a NoMethodError
  #
  # it "raises a LocalJumpError when not passed a block" do
  #   lambda { ImmutableSet[1].divide }.should raise_error(LocalJumpError)
  # end
end

describe "ImmutableSet#divide when passed a block with an arity of 2" do
  it "divides self into a set of subsets based on the blocks return values" do
    set = ImmutableSet[1, 3, 4, 6, 9, 10, 11].divide { |x, y| (x - y).abs == 1 }
    set.map { |x| x.to_a }.to_a.sort.should == [[1], [3, 4], [6], [9, 10, 11]]
  end

  it "yields each two Objects to the block" do
    ret = []
    ImmutableSet[1, 2].divide { |x, y| ret << [x, y] }
    ret.should == [[1, 1], [1, 2], [2, 1], [2, 2]]
  end
end
