shared_examples :sorted_set_2_include do |method|
  it "returns true when self contains the passed Object" do
    set = ImmutableSet::Pure["a", "b", "c"]
    set.send(method, "a").should be true
    set.send(method, "e").should be false
  end
end
