class ResultsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'results'
  end
end
