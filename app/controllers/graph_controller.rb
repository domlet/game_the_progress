class GraphController < ApplicationController
  def index
    # @results = Result.all
    #  p @results
    # boolean_array = @results.map do |result|
    #   result.is_correct
    # end
    # true_array = boolean_array.select {|boolean| boolean == true}
    # true_count = true_array.length
    # false_array = boolean_array.select {|boolean| boolean == false}
    # false_count = false_array.length
    # p true_count
    # p false_count
    # p boolean_array
    # respond_to do |format|
      # format.json {
        # @data = [true_count, false_count]
      # }
    # end
  end

  def samba
    @results = Result.all
     p @results
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
    # respond_to do |format|
      # format.json {
        render json: [true_count, false_count]
      # }
    # end
    # [true_count, false_count].to_json
    # @json_data = json: [true_count, false_count]
  end

  def show
    @users = User.all
    p "*" * 88
    p params
    p params[:id]
    if params[:id] != "index"
      @user = User.find(params[:id])
      true_count = 0
      false_count = 0
      @user.results.each do |result|
        if result.is_correct == true
          true_count += 1
        else
          false_count += 1
        end
      end
       @data = [true_count, false_count]
     end
  end

  # def
  # def data
  #   # These results show 2 bars for true and false in a game
  #   @results = Result.all
  #   boolean_array = @results.map do |result|
  #     result.is_correct
  #   end
  #   true_array = boolean_array.select {|boolean| boolean == true}
  #   true_count = true_array.length
  #   false_array = boolean_array.select {|boolean| boolean == false}
  #   false_count = false_array.length
  #   p true_count
  #   p false_count
  #   p boolean_array
  #   render json: [true_count, false_count]
    # respond_to do |format|
    #   format.json {
    #     render :json => [1,2,3,4,5]
    #   }
    # end
  # end

  # def user_results
  #   @users = User.all
  #   @users.each do |user|
  #     indiv_results = []
  #     if user.is_admin == false
  #       indiv_results.push(user)
  #     end
  #     p indiv_results
  #     p user.results
  #   end
  # end
end
