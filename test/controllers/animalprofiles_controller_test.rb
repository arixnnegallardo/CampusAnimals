require 'test_helper'

class AnimalprofilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animalprofile = animalprofiles(:one)
  end

  test "should get index" do
    get animalprofiles_url
    assert_response :success
  end

  test "should get new" do
    get new_animalprofile_url
    assert_response :success
  end

  test "should create animalprofile" do
    assert_difference('Animalprofile.count') do
      post animalprofiles_url, params: { animalprofile: { adopted: @animalprofile.adopted, animalID: @animalprofile.animalID, cagelabel: @animalprofile.cagelabel, color: @animalprofile.color, gender: @animalprofile.gender, location: @animalprofile.location, markings: @animalprofile.markings, name: @animalprofile.name, neutered: @animalprofile.neutered, profileID: @animalprofile.profileID, remarks: @animalprofile.remarks, species: @animalprofile.species, vaccinated: @animalprofile.vaccinated } }
    end

    assert_redirected_to animalprofile_url(Animalprofile.last)
  end

  test "should show animalprofile" do
    get animalprofile_url(@animalprofile)
    assert_response :success
  end

  test "should get edit" do
    get edit_animalprofile_url(@animalprofile)
    assert_response :success
  end

  test "should update animalprofile" do
    patch animalprofile_url(@animalprofile), params: { animalprofile: { adopted: @animalprofile.adopted, animalID: @animalprofile.animalID, cagelabel: @animalprofile.cagelabel, color: @animalprofile.color, gender: @animalprofile.gender, location: @animalprofile.location, markings: @animalprofile.markings, name: @animalprofile.name, neutered: @animalprofile.neutered, profileID: @animalprofile.profileID, remarks: @animalprofile.remarks, species: @animalprofile.species, vaccinated: @animalprofile.vaccinated } }
    assert_redirected_to animalprofile_url(@animalprofile)
  end

  test "should destroy animalprofile" do
    assert_difference('Animalprofile.count', -1) do
      delete animalprofile_url(@animalprofile)
    end

    assert_redirected_to animalprofiles_url
  end
end
