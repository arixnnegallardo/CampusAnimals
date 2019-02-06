require "application_system_test_case"

class AnimalprofilesTest < ApplicationSystemTestCase
  setup do
    @animalprofile = animalprofiles(:one)
  end

  test "visiting the index" do
    visit animalprofiles_url
    assert_selector "h1", text: "Animalprofiles"
  end

  test "creating a Animalprofile" do
    visit animalprofiles_url
    click_on "New Animalprofile"

    fill_in "Adopted", with: @animalprofile.adopted
    fill_in "Animalid", with: @animalprofile.animalID
    fill_in "Cagelabel", with: @animalprofile.cagelabel
    fill_in "Color", with: @animalprofile.color
    fill_in "Gender", with: @animalprofile.gender
    fill_in "Location", with: @animalprofile.location
    fill_in "Markings", with: @animalprofile.markings
    fill_in "Name", with: @animalprofile.name
    fill_in "Neutered", with: @animalprofile.neutered
    fill_in "Profileid", with: @animalprofile.profileID
    fill_in "Remarks", with: @animalprofile.remarks
    fill_in "Species", with: @animalprofile.species
    fill_in "Vaccinated", with: @animalprofile.vaccinated
    click_on "Create Animalprofile"

    assert_text "Animalprofile was successfully created"
    click_on "Back"
  end

  test "updating a Animalprofile" do
    visit animalprofiles_url
    click_on "Edit", match: :first

    fill_in "Adopted", with: @animalprofile.adopted
    fill_in "Animalid", with: @animalprofile.animalID
    fill_in "Cagelabel", with: @animalprofile.cagelabel
    fill_in "Color", with: @animalprofile.color
    fill_in "Gender", with: @animalprofile.gender
    fill_in "Location", with: @animalprofile.location
    fill_in "Markings", with: @animalprofile.markings
    fill_in "Name", with: @animalprofile.name
    fill_in "Neutered", with: @animalprofile.neutered
    fill_in "Profileid", with: @animalprofile.profileID
    fill_in "Remarks", with: @animalprofile.remarks
    fill_in "Species", with: @animalprofile.species
    fill_in "Vaccinated", with: @animalprofile.vaccinated
    click_on "Update Animalprofile"

    assert_text "Animalprofile was successfully updated"
    click_on "Back"
  end

  test "destroying a Animalprofile" do
    visit animalprofiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Animalprofile was successfully destroyed"
  end
end
