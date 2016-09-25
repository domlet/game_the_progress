require 'rubygems'
require 'json'

class ImportedGamesController < ApplicationController
  def import
    # p s.cell(1, 1) # roo methods are hard to use

    imported_game_roo = Roo::CSV.new("./public/spreadsheets/test.csv")
    imported_game_json = imported_game_roo.to_json
    p @imported_game_rows = JSON.parse(imported_game_json)
    p "*" * 50

    p "*" * 50
    i = 0
    new_object = Hash.new { |h, k| h[k] = ""} # making a hash with this "" default
    @imported_game_rows.each do |hash|

    @imported_game_rows[0].each do |cell|
      new_object[cell]
    end
    p new_object
    p "*" * 50

    # @imported_game_rows.each do |row|
    #   p row[i]
    #   i += 1
    # end

    # @imported_game_rows[0]

    redirect_to root_url, notice: "ImportedGames imported."
  end



  def index
  end

  private
  def get_the_things(args={})
    # game
    @title = title
    @subject = subject
    # question
    @question_text = question_text
    @category_id = category_id
    @correct_answer_id = correct_answer_id
    @game_id = game_id
    # answer
    @answer_a_text = answer_a_text
    @answer_b_text = answer_b_text
    @answer_c_text = answer_c_text
    @answer_d_text = answer_d_text
    @question_id = question_id
  end

end
