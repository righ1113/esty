module Esty
  VERSION = "0.2.1"

  # 構文2
  @@b = true

  class E
    macro s(bbb)
      @@b = {{bbb}}
    end
    macro if(t, e)
      if @@b
        {{t}}
      else
        {{e}}
      end
    end
  end

  class Ty < E
  end
end


# Bool 構造体にメソッドを追加
struct Bool
  def ifp(t, e)
    return t.responds_to?(:call) ? t.call : t if self
    e.responds_to?(:call) ? e.call : e
  end
end



