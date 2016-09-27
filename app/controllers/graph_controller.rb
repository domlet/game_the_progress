class GraphController < ApplicationController

  def students
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

    data = {
          clickable: false,
          data: [
                  {label: "name1", value: 8, id: 1},
                  {label: "name2", value: 3, id: 1},
                  {label: "name3", value: 2, id: 1},
                  {label: "name4", value: 6, id: 1},
                  {label: "name5", value: 1, id: 1},
                  {label: "name6", value: 7, id: 1}
                ]
          }
          p data
    @data = data.to_json
          p @data
  # Return JSON object of whole class student

  end

  def show
    @users = User.all
    # p "*" * 88
    # p params
    # p params[:id]
    # if params[:id] != "index"
    #   @user = User.find(params[:id])
    #   true_count = 0
    #   false_count = 0
    #   @user.results.each do |result|
    #     if result.is_correct == true
    #       true_count += 1
    #     else
    #       false_count += 1
    #     end
    #   end
    #    @data = [true_count, false_count]
    #  end

        data = {
          clickable: false,
          data: [
                  {label: "Good", value: 8, id: 1},
                  {label: "Bad", value: 3, id: 1}
                ]
          }
          p data
    @data = data.to_json
          p @data
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
