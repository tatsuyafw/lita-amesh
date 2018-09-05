# lita-amesh

lita-amesh is a handler for Lita that displays a Tokyo amesh image in a chart room.

## Installation
Add lita-amesh to your Lita instance's Gemfile:

``` ruby
gem "lita-amesh"
```

And this gem requires ImageMagick or GraphicsMagick command-line tool. You can check if you have it installed by running.

```console
$ convert -version
```

## Configuration

### Required attributes

NOTE: As of now, this gem only supports the Slack adapter.

- `config.adapters.slack.token` (String)

   A token for Slack API

## Usage

```
Lita: amesh
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tatsuyafw/lita-amesh.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
