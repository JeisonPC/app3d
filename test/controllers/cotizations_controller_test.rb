require "test_helper"

class CotizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cotization = cotizations(:one)
  end

  test "should get index" do
    get cotizations_url
    assert_response :success
  end

  test "should get new" do
    get new_cotization_url
    assert_response :success
  end

  test "should create cotization" do
    assert_difference("Cotization.count") do
      post cotizations_url, params: { cotization: { email: @cotization.email, file: @cotization.file, price: @cotization.price } }
    end

    assert_redirected_to cotization_url(Cotization.last)
  end

  test "should show cotization" do
    get cotization_url(@cotization)
    assert_response :success
  end

  test "should get edit" do
    get edit_cotization_url(@cotization)
    assert_response :success
  end

  test "should update cotization" do
    patch cotization_url(@cotization), params: { cotization: { email: @cotization.email, file: @cotization.file, price: @cotization.price } }
    assert_redirected_to cotization_url(@cotization)
  end

  test "should destroy cotization" do
    assert_difference("Cotization.count", -1) do
      delete cotization_url(@cotization)
    end

    assert_redirected_to cotizations_url
  end
end
