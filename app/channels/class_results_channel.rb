# Creates the ability to create Class Results Channel Objects
# Each of those objects has a subscribed method
# That method accesses the stream/channel/wormhole

class ClassResultsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'class_results'
  end
end
