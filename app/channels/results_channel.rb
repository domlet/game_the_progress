# Creates the ability to create Results Channel Objects
# Each of those objects has a subscribed method
# That method accesses the stream/channel/wormhole

class ResultsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'results'
  end
end
