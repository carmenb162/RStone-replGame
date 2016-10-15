## NOTES FOR TOMORROW
## DON'T TRY TO GET THE PROC TO WORK
## PASS A TEXT BLOCK IN THE HASH
## PROVE THAT IT WORKS THEN ATTEMPT THE PROC AGAIN

require 'pry'
require "csv"

story = []

# PASS PROC TO HASH
def chapter_creator(death_status, choice_1, choice_2, story_text)

  chapter = {
    story_text: story_text,
    death_status: death_status,
    choice_1: choice_1,
    choice_2: choice_2
  }
  return chapter
end

# ITERATE ARRAY
def read_book(incoming_chapter)
  valid_choices =*(1..2)
  user_choice = nil
  if incoming_chapter[:death_status] == "alive"
    puts incoming_chapter[:story_text]
    until valid_choices.include? user_choice
        puts "\nMake your decision."
        user_choice = gets.chomp.to_i
    end
  else
    abort(incoming_chapter[:story_text])

  end
  return {next_chapter:(user_choice - 1), death_status:incoming_chapter[:death_status] }
end

# READ CSV & STORE HASH IN ARRAY
CSV.foreach( "./story.csv",
              :quote_char => '|',
              :force_quotes => 'false') do |row|
  story << chapter_creator(row[0], row[1], row[2], row[3])
end


death_status = nil
current_chapter = 0
until death_status == true
  if current_chapter == 0
    response_hash = read_book(story[0])
  else
     response_hash = read_book(story[response_hash[:next_chapter]])
  end
  death_status = response_hash[:death_status]
  current_chapter = response_hash[:next_chapter]
end
