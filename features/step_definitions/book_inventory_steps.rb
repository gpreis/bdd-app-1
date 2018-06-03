Given("I have populated my inventory with several books") do
  FactoryBot.create :book,
                    :user => @registered_user,
                    :name => "Don Quixote",
                    :author => "Miguel de Cervantes"

  FactoryBot.create :book,
                    :user => @registered_user,
                    :name => "Dom Casmurro",
                    :author => "Machado de Assis"
end

Then("I should see the list of my books") do
  expect(page).to have_content("Don Quixote")
  expect(page).to have_content("Dom Casmurro")
end

When("I submit a new book to my inventory") do
  click_link "New Book"

  fill_in "book_name", with: "Meditations"
  fill_in "book_author", with: "Marcus Aurelius"

  click_button "Create Book"
end

Then("I should see the new book in my inventory") do
  visit books_path

  expect(page).to have_content("Meditations")
  expect(page).to have_content("Marcus Aurelius")
end
