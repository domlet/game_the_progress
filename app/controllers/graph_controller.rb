class GraphController < ApplicationController

  # Method to show average score for all students on a game for teacher view
  # ADD average
  # route: /graph/students
  def students
    @results = Result.all
    boolean_array = @results.map do |result|
      result.is_correct
    end
    true_array = boolean_array.select {|boolean| boolean == true}
    true_count = (true_array.length * 100)/5

     data = {
          clickable: false,
          data: [
                  {label: "", value: true_count, id: 1},
                ]
          }
    @data = data.to_json

     ################ PRACTICE CODE ##################################

     # Method to get results on each individual question
 # @game = Game.find(1)

 #    @game.questions.each do |question|
 #          a_answers = 0
 #          b_answers = 0
 #          c_answers = 0
 #          d_answers = 0
 #      question.results.each do |result|
 #        if result.student_answer_id == question.answers[0].id
 #          a_answers += 1
 #        elsif result.student_answer_id == question.answers[1].id
 #          b_answers += 1
 #        elsif result.student_answer_id == question.answers[2].id
 #          c_answers += 1
 #        elsif result.student_answer_id == question.answers[3].id
 #          d_answers += 1
 #        end
 #      end
 #    p "*" * 20
 #    p a_answers
 #    p b_answers
 #    p c_answers
 #    p d_answers
 #    end






################ START FRESH CODE ##################################





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
   # route: /graph/student/:id
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
