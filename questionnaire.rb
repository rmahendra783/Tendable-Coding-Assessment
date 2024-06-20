require "pstore" # https://github.com/ruby/pstore

STORE_NAME = "tendable.pstore"
store = PStore.new(STORE_NAME)

QUESTIONS = {
  "q1" => "Can you code in Ruby?",
  "q2" => "Can you code in JavaScript?",
  "q3" => "Can you code in Swift?",
  "q4" => "Can you code in Java?",
  "q5" => "Can you code in C#?"
}.freeze

def do_prompt(store)
  current_run_answers = {}

  QUESTIONS.each do |question_key, question|
    answer = nil
    loop do
      print "#{question} (Yes/No): "
      answer = gets.chomp.downcase
      break if ["yes", "no", "y", "n"].include?(answer)
      puts "Invalid answer. Please answer with Yes/Y or No/N."
    end
    current_run_answers[question_key] = ["yes", "y"].include?(answer)
  end

  store.transaction do
    store[:all_runs] ||= []
    store[:all_runs] << current_run_answers
  end
end

def calculate_rating(answers)
  yes_count = answers.values.count(true)
  (100.0 * yes_count / QUESTIONS.size).round(2)
end

def calculate_average_rating(all_runs)
  return 0 if all_runs.empty?

  total_rating = all_runs.sum { |answers| calculate_rating(answers) }
  (total_rating / all_runs.size).round(2)
end

def do_report(store)
  store.transaction(true) do
    all_runs = store[:all_runs] || []
    current_run_answers = all_runs.last
    current_run_rating = calculate_rating(current_run_answers)
    average_rating = calculate_average_rating(all_runs)

    puts "\nSurvey Report:"
    QUESTIONS.each do |question_key, question|
      answer = current_run_answers[question_key] ? "Yes" : "No"
      puts "#{question} - Answer: #{answer}"
    end

    puts "\nRating for this run: #{current_run_rating}%"
    puts "Average rating for all runs: #{average_rating}%"
  end
end

# Execute the methods
do_prompt(store)
do_report(store)
