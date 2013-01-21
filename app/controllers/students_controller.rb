require 'open-uri'

class StudentsController < ApplicationController

  def morning
    @students = Student.fetch("am")

    @color = params["color"]
  end

  def afternoon
    @students = Student.fetch("pm")
  end

  def index
    user_input = params["section"]

    if user_input != nil
      @students = Student.fetch(user_input)
    else
      @students = Student.fetch("am") + Student.fetch("pm")
    end
  end














end
