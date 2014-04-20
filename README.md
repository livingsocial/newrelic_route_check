# NewrelicRouteCheck

Compares New Relic controller_summary.csv to the routes defined in a Rails app

## Installation

Add this line to your application's Gemfile:

    gem 'newrelic_route_check'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install newrelic_route_check

## Usage

This gem requires you use New Relic to download your `controller_summary.csv` from the transaction history tab. Preferably with the 7 day history to have the best coverage. Download the file to `./tmp/controller_summary.csv` then you can run: `bundle exec rake newrelic:compare_with_routes`

Which should give output of routes that are defined in your app but not receiving any traffic.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
