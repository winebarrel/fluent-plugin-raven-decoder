# fluent-plugin-raven-decoder

Fluentd plugin to decode Raven data.

[Raven](https://github.com/getsentry/raven-ruby) is a client for [Sentry](https://getsentry.com/welcome/).

[![Gem Version](https://badge.fury.io/rb/fluent-plugin-raven-decoder.svg)](http://badge.fury.io/rb/fluent-plugin-raven-decoder)
[![Build Status](https://travis-ci.org/winebarrel/fluent-plugin-raven-decoder.svg?branch=master)](https://travis-ci.org/winebarrel/fluent-plugin-raven-decoder)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fluent-plugin-raven-decoder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-raven-decoder

## Configuration

```
<match raven.error>
  type raven_decoder
  prefix decoded
  #data_field data
  #ignore_fields ["modules", "exception"]
</match>
```

## Usage

```sh
# Raven data
# see https://github.com/cookpad/raven-transports-fluentd
DATA='{"auth_header":"Sentry sentry_version=5, ..." "data":"eJz...="}'
echo $DATA | fluent-cat raven.error
# decoded to: {"event_id":"747...","message":"ZeroDivisionError: divided by 0",...
```
