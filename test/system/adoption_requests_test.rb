require "application_system_test_case"

class AdoptionRequestsTest < ApplicationSystemTestCase
  setup do
    @adoption_request = adoption_requests(:one)
  end

  test "visiting the index" do
    visit adoption_requests_url
    assert_selector "h1", text: "Adoption Requests"
  end

  test "creating a Adoption request" do
    visit adoption_requests_url
    click_on "New Adoption Request"

    fill_in "Contactno", with: @adoption_request.contactno
    fill_in "Email", with: @adoption_request.email
    fill_in "Letter of intent", with: @adoption_request.letter_of_intent
    fill_in "Name", with: @adoption_request.name
    fill_in "Pet", with: @adoption_request.pet
    click_on "Create Adoption request"

    assert_text "Adoption request was successfully created"
    click_on "Back"
  end

  test "updating a Adoption request" do
    visit adoption_requests_url
    click_on "Edit", match: :first

    fill_in "Contactno", with: @adoption_request.contactno
    fill_in "Email", with: @adoption_request.email
    fill_in "Letter of intent", with: @adoption_request.letter_of_intent
    fill_in "Name", with: @adoption_request.name
    fill_in "Pet", with: @adoption_request.pet
    click_on "Update Adoption request"

    assert_text "Adoption request was successfully updated"
    click_on "Back"
  end

  test "destroying a Adoption request" do
    visit adoption_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adoption request was successfully destroyed"
  end
end
