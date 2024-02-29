
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
