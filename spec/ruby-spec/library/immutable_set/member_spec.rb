require_relative '../../../spec_helper'
require_relative 'shared/include'
require 'set'

describe "ImmutableSet#member?" do
  it_behaves_like :sorted_set_1_include, :member?
end
