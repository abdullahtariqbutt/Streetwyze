require "test_helper"

class AssestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assest = assests(:one)
  end

  test "should get index" do
    get assests_url
    assert_response :success
  end

  test "should get new" do
    get new_assest_url
    assert_response :success
  end

  test "should create assest" do
    assert_difference('Assest.count') do
      post assests_url, params: { assest: { address: @assest.address, category: @assest.category, leave_rating: @assest.leave_rating, name: @assest.name, rating: @assest.rating, story: @assest.story, stuff_type: @assest.stuff_type } }
    end

    assert_redirected_to assest_url(Assest.last)
  end

  test "should show assest" do
    get assest_url(@assest)
    assert_response :success
  end

  test "should get edit" do
    get edit_assest_url(@assest)
    assert_response :success
  end

  test "should update assest" do
    patch assest_url(@assest), params: { assest: { address: @assest.address, category: @assest.category, leave_rating: @assest.leave_rating, name: @assest.name, rating: @assest.rating, story: @assest.story, stuff_type: @assest.stuff_type } }
    assert_redirected_to assest_url(@assest)
  end

  test "should destroy assest" do
    assert_difference('Assest.count', -1) do
      delete assest_url(@assest)
    end

    assert_redirected_to assests_url
  end
end
