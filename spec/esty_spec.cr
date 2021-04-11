require "./spec_helper"

struct Int
  include Esty
  # 階乗
  def fact
    self.<=(0).if 1, D.i(self.pred.fact.*(self))
  end
end

describe Esty do
  it "works" do
    10.fact.should eq(3628800)
  end
end



