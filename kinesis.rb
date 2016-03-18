#!/usr/bin/env ruby
require 'bundler'
Bundler.require

def reshard(opts)
  kinesis = Aws::Kinesis::Client.new(region: opts[:region])
  p kinesis.operation_names
  p opts
end

cli = HighLine.new
cli.choose do |menu|
  menu.prompt = 'Please choose your desired action: '
  menu.choice(:reshard) do
    reshard(region: cli.ask('Amazon region: ', String),
            stream: cli.ask('Stream name: ', String),
            shards: cli.ask('Desired shards number: ', Integer))
  end
end
