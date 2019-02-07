require "application_system_test_case"

class ViewprofilesTest < ApplicationSystemTestCase
  setup do
    @viewprofile = viewprofiles(:one)
  end

  test "visiting the index" do
    visit viewprofiles_url
    assert_selector "h1", text: "Viewprofiles"
  end

  test "creating a Viewprofile" do
    visit viewprofiles_url
    click_on "New Viewprofile"

    click_on "Create Viewprofile"

    assert_text "Viewprofile was successfully created"
    click_on "Back"
  end

  test "updating a Viewprofile" do
    visit viewprofiles_url
    click_on "Edit", match: :first

    click_on "Update Viewprofile"

    assert_text "Viewprofile was successfully updated"
    click_on "Back"
  end

  test "destroying a Viewprofile" do
    visit viewprofiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Viewprofile was successfully destroyed"
  end
end
