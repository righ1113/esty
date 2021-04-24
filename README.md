# esty

Enjoy one-liner programming!

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     esty:
       github: righ1113/esty
   ```

2. Run `shards install`

## Usage

```crystal
require "esty"

# example
struct Int
  include Esty
  # factorial
  def fact
    self.<=(0).ifp 1, ->{self.pred.fact.*(self)}
  end
  # Fibonacci
  def fib
    self.<=(1).ifp self, ->{self.pred.fib.+(self.pred.pred.fib)}
  end
  # collatz (0 is inf loop)
  def collatz
    self.==(1).ifp [1], ->{self.odd?.ifp ->{self.*(3).succ.collatz.unshift(self)}, ->{self.tdiv(2).collatz.unshift(self)}}
  end
  # FizzBuzz
  def fizzbuzz
    (s = (self.%(3).==(0).ifp "Fizz", "").+(self.%(5).==(0).ifp "Buzz", "")).==("").ifp self.to_s, s
  end
  # zundoko
  def zdk_base(str_arr)
    rand.>(0.5).ifp ->{self.succ.zdk_base str_arr << "Zun"},
      ->{(self.>=(4)).ifp ->{str_arr << "Doko" << "Ki-Yo-Shi!"}, ->{0.zdk_base str_arr << "Doko"}}
  end
end

# run
puts 10.fact # => 3628800

puts (0..10).to_a.map &.fib.as(Int32) # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

puts 3.collatz # => [3, 10, 5, 16, 8, 4, 2, 1]

puts (1..30).to_a.map &.fizzbuzz
# => ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz", "16", "17", "Fizz", "19", "Buzz", "Fizz", "22", "23", "Fizz", "Buzz", "26", "Fizz", "28", "29", "FizzBuzz"]

def zdk
  0.zdk_base [] of String
end
puts zdk # => ["Doko", "Zun", "Zun", "Zun", "Zun", "Doko", "Ki-Yo-Shi!"]
```
do not use  
```crystal
class StateMachine
  State_tbl = {t0: [0, 2, 2, 3], t1: [2, 1, 1, 3], t2: [0, 1, 3, 0], t3: [0, 0, 2, 1]}
  getter state
  def initialize(init_s : Int32)
    @state = init_s
  end
  macro def_trans(name)
    def {{name}}
      @state = State_tbl[:{{name}}][@state]
      self
    end
  end
  def_trans t0
  def_trans t1
  def_trans t2
  def_trans t3
end

# run
puts StateMachine.new(0).t0.t1.t2.t3.t0.t1.t2.t3.state # => 0
```

syntax 2
```crystal
struct Int
  include Esty
  # factorial
  def fact
    E.s(self.<=(0));Ty.if 1, self.pred.fact.*(self)
  end
end
```

<br />

## Contributors

- [righ1113](https://github.com/righ1113) - creator and maintainer

<br />

## 更新履歴
21/04/25 v0.2.1 README の軽微な訂正  
21/04/25 v0.2.0 構文1 を刷新 & 構文2 を追加  
21/04/11 v0.1.0 init
