require_relative '../../../spec_helper'
require_relative 'shared/union'
require 'set'

describe "ImmutableSet#union" do
  it_behaves_like :sorted_set_1_union, :union
end

describe "ImmutableSet#|" do
  it_behaves_like :sorted_set_1_union, :|
end
