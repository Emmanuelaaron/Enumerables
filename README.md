# Advanced Building Blocks - Enumerable Methods
> In this project, I implemented my own version of Ruby's enumerable methods. I created them in a way that they  return the same results as the original when they are called.
Below are the methods implemented
- each
- each_with_index
- select
- all?
- any?
- none?
- count
- map
- inject
## Built With

- Ruby

## Getting Started
- Clone this repo on your local machine
- Run the command `bundle install` in your terminal
- Insert the lines below any where in your main.rb file to text the methods
```
hash = Hash.new
%w(cat dog wombat).my_each_with_index { |item, index|
  hash[item] = index
}
p hash 

p [1,2,3,4,5].my_select { |num|  num.even?  }  

p %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
p %w[ant bear cat].my_all?(/t/)                        #=> false
p [1, 2i, 3.14].my_all?(Numeric)                       #=> true
p [nil, true, 99].my_all?                              #=> false
p [].my_all?                                           #=> true

p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
p %w[ant bear cat].my_any?(/d/)                        #=> false
p [nil, true, 99].my_any?(Integer)                     #=> true
p [nil, true, 99].my_any?                              #=> true
p [].my_any?                                           #=> false

p %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
p %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
p %w{ant bear cat}.my_none?(/d/)                        #=> true
p [1, 3.14, 42].my_none?(Float)                         #=> false
p [].my_none?                                           #=> true
p [nil].my_none?                                        #=> true
p [nil, false].my_none?                                 #=> true
p [nil, false, true].my_none?                           #=> false

ary = [1, 2, 4, 2]
p ary.my_count               #=> 4
p ary.my_count(2)            #=> 2
p ary.my_count{ |x| x%2==0 } #=> 3

p (1..4).my_map { |i| i*i }      #=> [1, 4, 9, 16]
p (1..4).my_map { "cat"  }   #=> ["cat", "cat", "cat", "cat"]

p (5..10).my_inject(:+)                             #=> 45
p (5..10).my_inject { |sum, n| sum + n }            #=> 45
p (5..10).my_inject(1, :*)                          #=> 151200
p (5..10).my_inject(1) { |product, n| product * n } #=> 151200
longest = %w{ cat sheeps bear }.my_inject do |memo, word|
   memo.length > word.length ? memo : word
end
p longest                                        #=> "sheeps"

p multiply_els([2,4,5]) #=> 40

```

### Prerequisites
To make this repository working in your local machine you need [ruby](https://rubyinstaller.org/) installed.

## Authors

👤 **Emmanuel Isabirye**

- Github: [@EmmanuelAaron](https://github.com/Emmanuelaaron)
- Twitter: [@EmmanuelAaron](https://twitter.com/EmmanuelIsabir1)
- Linkedin: [@EmmanuelAaron](https://www.linkedin.com/in/fullstackwebdev-emma/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Emmanuelaaron/Enumerables/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Great Thanks to [Guilherme Recordon](https://github.com/guirecordon)  for the support given during the execution of this project

## 📝 License

This project is [MIT](lic.url) licensed.
