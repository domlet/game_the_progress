class GraphController < ApplicationController

  # Method to show results for all students on teacher view
  # route: /graph/students
  def students
    @results = Result.all
    boolean_array = @results.map do |result|
      result.is_correct
    end
    true_array = boolean_array.select {|boolean| boolean == true}
    true_count = (true_array.length * 100)/5
    false_array = boolean_array.select {|boolean| boolean == false}
    false_count = false_array.length
    p "*" * 20
    p true_count
     data = {
          clickable: false,
          data: [
                  {label: "Correct", value: true_count, id: 1},
                  {label: "Incorrect", value: false_count, id: 1},

                ]
          }
          # p "*" * 20
          # p data
    @data = data.to_json

     ################ PRACTICE CODE ##################################
 # @users = User.all
 #    if params[:id] != "index"
 #      @user = User.find(params[:id])
 #      true_count = 0
 #      false_count = 0
 #      @user.results.each do |result|
 #        if result.is_correct == true
 #          true_count += 1
 #        else
 #          false_count += 1
 #        end
 #      end

 #     end
 #      data = {
 #          clickable: false,
 #          data: [
 #                  {label: "Correct", value: true_count},
 #                  {label: "Incorrect", value: false_count}
 #                ]
 #              }
 #     @data = data.to_json
     ################ START FRESH CODE ##################################
    # @users = User.all
    # if params[:id] != "index"
    #   @user = User.find(params[:id])
    #   true_count = 0
    #   false_count = 0
    #   @users.results.each do |result|
    #     if result.is_correct == true_count
    #       true_count += 1
    #     else
    #       false_count += 1
    #     end

    #   data = {
    #     clickable: false,
    #     data: [
    #             { label: user.first_name, value: true_count, id: user.id }
    #     ]
    #   }
     # @data = data.to_json
    # end
    # end


####### HARDCODED FOR GRAPH ##############
    # data = {
    #       clickable: false,
    #       data: [
    #               {label: "name1", value: 8, id: 1},
    #               {label: "name2", value: 3, id: 1},
    #               {label: "name3", value: 2, id: 1},
    #               {label: "name4", value: 6, id: 1},
    #               {label: "name5", value: 1, id: 1},
    #               {label: "name6", value: 7, id: 1}
    #             ]
    #       }
    #       p data
    # @data = data.to_json
####### END HARDCODED FOR GRAPH ##############

  end

  # Method to show individual student results
  def show
    @users = User.all
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

     end
      data = {
          clickable: false,
          data: [
                  {label: "Correct", value: true_count},
                  {label: "Incorrect", value: false_count}
                ]
              }
     @data = data.to_json

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
