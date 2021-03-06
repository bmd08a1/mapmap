require 'rails_event_store'
require 'aggregate_root'
require 'arkency/command_bus'

Rails.configuration.to_prepare do
  Rails.configuration.event_store = RailsEventStore::Client.new
  Rails.configuration.command_bus = Arkency::CommandBus.new

  AggregateRoot.configure do |config|
    config.default_event_store = Rails.configuration.event_store
  end

  # Subscribe event handlers below
  Rails.configuration.event_store.tap do |store|
    store.subscribe(Leaves::OnRequestSubmitted, to: [Leave::RequestSubmitted])
  end

  # Register command handlers below
  Rails.configuration.command_bus.tap do |bus|
    bus.register(Leave::SubmitRequest, Leave::OnSubmitRequest.new)
  end
end
