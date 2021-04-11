module Esty
  VERSION = "0.1.0"

  # 遅延評価
  class Delay(T)
    def initialize(init_v : T, &block : -> T)
      @func = block
      @flag = false
      @value = init_v
    end
    def force
      unless @flag
        ret = @func.call
        @value = ret.nil? ? raise("@func.call is nil. #{@func}") : ret
        @flag = true
      end
      @value
    end
  end

  # 短縮マクロ
  class D
    macro i(x)
      Delay(Int32).new(0){{{x}}}
    end
    macro s(x)
      Delay(String).new(""){{{x}}}
    end
    macro ai(x)
      Delay(Array(Int32)).new([0]){{{x}}}
    end
    macro ast(x)
      Delay(Array(String)).new([""]){{{x}}}
    end
  end
end

# Bool 構造体にメソッドを追加
struct Bool
  def if(t, e)
    return t.responds_to?(:force) ? t.force : t if self
    e.responds_to?(:force) ? e.force : e
  end
end



