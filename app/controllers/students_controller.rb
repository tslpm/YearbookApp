require 'open-uri'

class StudentsController < ApplicationController

  def morning
    url = "http://tslwebdev.herokuapp.com/am.json"
    json_string = open(url).read
    student_hashes = JSON.parse(json_string)

    @students = Array.new
    student_hashes.each do |student_hash|
      s = Student.new
      s.name = student_hash["name"]
      s.twitter = student_hash["twitter"]
      s.photo_url = student_hash["photo_url"]
      s.section = student_hash["section"]

      @students << s
    end
  end

  def afternoon
    url = "http://tslwebdev.herokuapp.com/pm.json"
    json_string = open(url).read
    student_hashes = JSON.parse(json_string)

    @students = Array.new
    student_hashes.each do |student_hash|
      s = Student.new
      s.name = student_hash["name"]
      s.twitter = student_hash["twitter"]
      s.photo_url = student_hash["photo_url"]
      s.section = student_hash["section"]

      @students << s
    end
  end

end
