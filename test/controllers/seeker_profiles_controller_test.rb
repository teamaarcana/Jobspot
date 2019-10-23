require 'test_helper'

class SeekerProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seeker_profile = seeker_profiles(:one)
  end

  test "should get index" do
    get seeker_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_seeker_profile_url
    assert_response :success
  end

  test "should create seeker_profile" do
    assert_difference('SeekerProfile.count') do
      post seeker_profiles_url, params: { seeker_profile: {  } }
    end

    assert_redirected_to seeker_profile_url(SeekerProfile.last)
  end

  test "should show seeker_profile" do
    get seeker_profile_url(@seeker_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_seeker_profile_url(@seeker_profile)
    assert_response :success
  end

  test "should update seeker_profile" do
    patch seeker_profile_url(@seeker_profile), params: { seeker_profile: {  } }
    assert_redirected_to seeker_profile_url(@seeker_profile)
  end

  test "should destroy seeker_profile" do
    assert_difference('SeekerProfile.count', -1) do
      delete seeker_profile_url(@seeker_profile)
    end

    assert_redirected_to seeker_profiles_url
  end
end
