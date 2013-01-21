require 'open-uri'

class Student
  attr_accessor "name"
  attr_accessor "photo_url"
  attr_accessor "section"
  attr_accessor "twitter"

  def Student.fetch(section)
    url = "http://tslwebdev.herokuapp.com/#{section}.json"
    json_string = open(url).read

    student_hashes = JSON.parse(json_string)

    array_of_student_objects = Array.new
    student_hashes.each do |student_hash|
      s = Student.new(student_hash["name"],
                      student_hash["twitter"],
                      student_hash["photo_url"],
                      student_hash["section"])
      array_of_student_objects << s
    end
    return array_of_student_objects
  end

  def initialize(the_name, handle, pic_url, the_section)
    @name = the_name
    @twitter = handle
    @photo_url = pic_url
    @section = the_section
  end
end
