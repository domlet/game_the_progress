class GraphController < ApplicationController
  def index
  end

  def data
    # Need to make results specific to a game, not all database results
    @results = Result.all
    boolean_array = @results.map do |result|
      result.is_correct
    end
    true_array = boolean_array.select {|boolean| boolean == true}
    true_count = true_array.length
    false_array = boolean_array.select {|boolean| boolean == false}
    false_count = false_array.length
    p true_count
    p false_count
    p boolean_array
    render json: [true_count, false_count]
    # respond_to do |format|
    #   format.json {
    #     render :json => [1,2,3,4,5]
    #   }
    # end
  end

  def question_results
    @
  end
end
