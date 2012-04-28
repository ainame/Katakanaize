# Katakanaize

Katakanaize is a rack middleware to convert hiragana to katakana.

## Installation

Add this line to your application's Gemfile:

    gem 'katakanaize'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install katakanaize

## Usage
in config.ru
```ruby
require 'katakanaize'

use Katakanize
run YourApp.new
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
