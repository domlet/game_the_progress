class GraphController < ApplicationController

  # Method to show average score for all students on a game for teacher view
  # ADD average
  # route: /graph/students
  def students
    # @results = Result.all
    # boolean_array = @results.map do |result|
    #   result.is_correct
    # end
    # true_array = boolean_array.select {|boolean| boolean == true}
    # true_count = (true_array.length * 100)/5

    #  data = {
    #       clickable: false,
    #       data: [
    #               {label: "", value: true_count, id: 1},
    #             ]
    #       }
    # @data = data.to_json

     ################ PRACTICE CODE ##################################

     # Method to get results on each individual question
 @game = Game.find(1)

  total_data = []
    @game.questions.each do |question|
          a_answers = 0
          b_answers = 0
          c_answers = 0
          d_answers = 0
      question.results.each do |result|
        if result.student_answer_id == question.answers[0].id
          a_answers += 1
        elsif result.student_answer_id == question.answers[1].id
          b_answers += 1
        elsif result.student_answer_id == question.answers[2].id
          c_answers += 1
        elsif result.student_answer_id == question.answers[3].id
          d_answers += 1
        end
      end
      total_answers = a_answers + b_answers + c_answers + d_answers

      data = {
          clickable: true,
          url: '',
          chartTitle: question.text,
          data: [
                  { label: "A", value: (a_answers * 100) / total_answers },
                  { label: "B", value: (b_answers * 100) / total_answers },
                  { label: "C", value: (c_answers * 100) / total_answers },
                  { label: "D", value: (d_answers * 100) / total_answers }
          ]
      }
      total_data.push(data)
    end
    @data = total_data.to_json
  end

  # Method to show individual student results
   # route: /graph/student/:id
  def show
    @game = Game.find(1)
    @users = User.all
    total_questions = @game.questions.length
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
                  {label: "Correct", value: (true_count * 100) / total_questions },
                  {label: "Incorrect", value: (false_count * 100) / total_questions }
                ]
              }
     @data = data.to_json
    end
  end

