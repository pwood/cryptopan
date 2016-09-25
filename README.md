# Cryptopan

[![Build Status](https://travis-ci.org/pwood/cryptopan.svg?branch=master)](https://travis-ci.org/pwood/cryptopan)

This is a ruby implementation of the Crypto-PAn function providing prefix
consistency while anonymising IP addresses. This program is based on the paper
"Prefix-Preserving IP Address Anonymization: Measurement-based
Security Evaluation and a New Cryptography-based Scheme" written by
Jun Xu, Jinliang Fan, Mostafa H. Ammar, and Sue B. Moon.  The detailed
explanation can be found in [Xu2002].

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptopan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cryptopan

## Usage

*Note* Currently only supports IPv4 addresses.

```
2.0.0-p598 :001 > key = SecureRandom.random_bytes(32).bytes
 => [27, 8, 236, 31, 47, 181, 230, 41, 198, 24, 254, 3, 151, 151, 200, 75, 255, 197, 170, 3, 235, 236, 200, 41, 12, 10, 206, 127, 203, 162, 176, 206]
2.0.0-p598 :002 > c = CryptoPAn.new(key)
 => #<CryptoPAn:0x0000000349b350 @key="\e\b\xEC\x1F/\xB5\xE6)\xC6\x18\xFE\x03\x97\x97\xC8K", @pad=[214, 202, 47, 81, 14, 48, 182, 196, 30, 19, 88, 145, 215, 2, 249, 52]>
2.0.0-p598 :003 > c.anonymise("8.8.8.8")
 => "50.54.20.240"
2.0.0-p598 :004 > c.anonymise("8.8.4.4")
 => "50.54.28.11"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pwood/cryptopan.


## References

[Xu2002] Jun Xu, Jinliang Fan, Mostafa H. Ammar, and Sue B. Moon,
"Prefix-Preserving IP Address Anonymization: Measurement-based
Security Evaluation and a New Cryptography-based Scheme", in
Proceedings of the IEEE International Conference on Network Protocols,
Paris, 2002.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contributors

- Keiichi SHIMA, (https://github.com/keiichishima) - README.md and some test data shamelessly appropriated.
