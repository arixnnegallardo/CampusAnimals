require 'test_helper'

class ViewprofilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @viewprofile = viewprofiles(:one)
  end

  test "should get index" do
    get viewprofiles_url
    assert_response :success
  end

  test "should get new" do
    get new_viewprofile_url
    assert_response :success
  end

  test "should create viewprofile" do
    assert_difference('Viewprofile.count') do
      post viewprofiles_url, params: { viewprofile: {  } }
    end

    assert_redirected_to viewprofile_url(Viewprofile.last)
  end

  test "should show viewprofile" do
    get viewprofile_url(@viewprofile)
    assert_response :success
  end

  test "should get edit" do
    get edit_viewprofile_url(@viewprofile)
    assert_response :success
  end

  test "should update viewprofile" do
    patch viewprofile_url(@viewprofile), params: { viewprofile: {  } }
    assert_redirected_to viewprofile_url(@viewprofile)
  end

  test "should destroy viewprofile" do
    assert_difference('Viewprofile.count', -1) do
      delete viewprofile_url(@viewprofile)
    end

    assert_redirected_to viewprofiles_url
  end
end
