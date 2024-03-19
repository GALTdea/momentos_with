
User.create!(email: "user2@email.com", password: "password", password_confirmation: "password")

Prompt.create!(question: "What did you do today?")

4.times do |i|
  child = Child.create!(
    name: "Child #{i + 1}",
    description: "Child #{i + 1} description",
    user_id: 1 # Assuming you have a User with ID=1
  )

  # Assuming you want to create a single Prompt for each Child
  # Adjust the attributes for Prompt as needed
  Entry.create!(
    response: "",
    prompt_id: 1,
    child_id: child.id # This sets up the association between Prompt and Child
  )
end

Quiz.create!( title: "Quiz 1", description: "Quiz 1 description", active: "true", category: "category 1")
Quiz.create!( title: "Quiz 2", description: "Quiz 2 description", active: "true", category: "category 2")
Quiz.create!( title: "Quiz 3", description: "Quiz 3 description", active: "true", category: "category 3")
Quiz.create!( title: "Quiz 4", description: "Quiz 4 description", active: "true", category: "category 4")

puts "Created 4 quizzes"

20.times do |i|
  Question.create!(
    text: "Question #{i + 1}",
    question_type: "multiple_choice",
    options: ["Option 1", "Option 2", "Option 3", "Option 4"],
    category: "category #{i + 1}",
    status: "active",
    quiz_id: 1
  )
end
puts "Created 20 questions"

quiz = Quiz.find_by(title: "Quiz 1")
quiz.question_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

quiz = Quiz.find_by(title: "Quiz 2")
quiz.question_ids = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

quiz = Quiz.find_by(title: "Quiz 3")
quiz.question_ids = [1,6, 7, 8, 9, 10]
