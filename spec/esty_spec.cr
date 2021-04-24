# $ crystal spec spec/esty_spec.cr

require "./spec_helper"

struct Int
  include Esty
  # 階乗
  def fact
    self.<=(0).ifp 1, ->{self.pred.fact.*(self)}
  end
  def fact2
    #self.<=(0).y_s{|b| b ? 1 : self.pred.fact.*(self)}
    #self.<=(0).i &.f ? 1 : self.pred.fact.*(self)
    #self.<=(0) ? 1 : self.pred.fact.*(self)
    E.s(self.<=(0));Ty.if 1, self.pred.fact.*(self)
  end
end

describe Esty do
  it "work1" do
    10.fact.should eq(3628800)
  end
  it "work2" do
    10.fact2.should eq(3628800)
  end
end



