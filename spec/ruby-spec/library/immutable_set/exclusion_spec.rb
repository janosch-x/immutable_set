require_relative '../../../spec_helper'
require 'set'

describe "ImmutableSet#^" do
  before :each do
    @set = ImmutableSet[1, 2, 3, 4]
  end

  it "returns a new ImmutableSet containing elements that are not in both self and the passed Enumberable" do
    (@set ^ ImmutableSet[3, 4, 5]).should == ImmutableSet[1, 2, 5]
    (@set ^ [3, 4, 5]).should == ImmutableSet[1, 2, 5]
  end

  it "raises an ArgumentError when passed a non-Enumerable" do
    lambda { @set ^ 3 }.should raise_error(ArgumentError)
    lambda { @set ^ Object.new }.should raise_error(ArgumentError)
  end
end
