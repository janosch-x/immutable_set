require_relative '../../../spec_helper'
require 'set'
require_relative 'shared/difference'

describe "ImmutableSet::Pure#-" do
  it_behaves_like :sorted_set_2_difference, :-
end
