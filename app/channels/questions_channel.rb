# Creates the ability to create Questions Channel Objects
# Each of those objects has a subscribed method
# That method accesses the stream/channel/wormhole

class QuestionsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game-#{params['game']}:questions"
  end
end
