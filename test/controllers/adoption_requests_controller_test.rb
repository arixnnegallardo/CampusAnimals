require 'test_helper'

class AdoptionRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adoption_request = adoption_requests(:one)
  end

  test "should get index" do
    get adoption_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_adoption_request_url
    assert_response :success
  end

  test "should create adoption_request" do
    assert_difference('AdoptionRequest.count') do
      post adoption_requests_url, params: { adoption_request: { contactno: @adoption_request.contactno, email: @adoption_request.email, letter_of_intent: @adoption_request.letter_of_intent, name: @adoption_request.name, pet: @adoption_request.pet } }
    end

    assert_redirected_to adoption_request_url(AdoptionRequest.last)
  end

  test "should show adoption_request" do
    get adoption_request_url(@adoption_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_adoption_request_url(@adoption_request)
    assert_response :success
  end

  test "should update adoption_request" do
    patch adoption_request_url(@adoption_request), params: { adoption_request: { contactno: @adoption_request.contactno, email: @adoption_request.email, letter_of_intent: @adoption_request.letter_of_intent, name: @adoption_request.name, pet: @adoption_request.pet } }
    assert_redirected_to adoption_request_url(@adoption_request)
  end

  test "should destroy adoption_request" do
    assert_difference('AdoptionRequest.count', -1) do
      delete adoption_request_url(@adoption_request)
    end

    assert_redirected_to adoption_requests_url
  end
end
