![][ruby-shield]

<p align="center">
  <img width="200" src="https://user-images.githubusercontent.com/50866745/147449973-a743b690-fef4-4b97-86d3-cc01f1695118.png" >
</p>


# ActiveKsql 

[![GitHub license](https://badgen.net/github/license/Naereen/Strapdown.js)](https://github.com/Naereen/StrapDown.js/blob/master/LICENSE) ![gem](https://img.shields.io/badge/gem-0.1.0.alpha-blue) [![stability-alpha](https://img.shields.io/badge/stability-alpha-f4d03f.svg)](https://github.com/mkenney/software-guides/blob/master/STABILITY-BADGES.md#alpha) 

ActiveKsql allows you to perform SQL requests to your ksqlDB server.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_ksql'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install active_ksql

## Usage

The gem is currently under development although you can start using the beta version.

### Configuration

Run `rails generate active_ksql` to generate the gem initializer.

```Ruby
ActiveKsql.configure do |config|
  config.host = "http://localhost:8088"
  config.api_key = ""
  config.api_secret = ""
end
```

### API Client

At the moment the client allows you to run [queries](https://docs.ksqldb.io/en/latest/developer-guide/ksqldb-rest-api/query-endpoint/) and to execute [statements](https://docs.ksqldb.io/en/latest/developer-guide/ksqldb-rest-api/ksql-endpoint/).

### Queries

To run queries you can use the client's `query` method, like so:

```Ruby
client = ActiveKsql::Api.new

client.query("SELECT * FROM pageviews EMIT CHANGES;", {
    streams_properties: {
        "ksql.streams.auto.offset.reset": "earliest"
    }
})
```

Optional arguments are:

- streams_properties

### Statements

Same as for queries you can use the client's `ksql` method, like so:

```Ruby
client = ActiveKsql::Api.new

client.ksql("CREATE STREAM pageviews_home AS SELECT * FROM pageviews_original WHERE pageid='home';", {
    streams_properties: {
        "ksql.streams.auto.offset.reset": "earliest"
    }
})
```

Optional arguments are:

- streams_properties
- session_variables
- command_sequence_number


## Development

The gem will soon act as an ORM.
We're planning to develop and release enhancements early 2022.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/LapoElisacci/active_ksql.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

<!--- MARKDOWN LINKS --->

[ruby-shield]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white

