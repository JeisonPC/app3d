require "application_system_test_case"

class CotizationsTest < ApplicationSystemTestCase
  setup do
    @cotization = cotizations(:one)
  end

  test "visiting the index" do
    visit cotizations_url
    assert_selector "h1", text: "Cotizations"
  end

  test "should create cotization" do
    visit cotizations_url
    click_on "New cotization"

    fill_in "Email", with: @cotization.email
    fill_in "File", with: @cotization.file
    fill_in "Price", with: @cotization.price
    click_on "Create Cotization"

    assert_text "Cotization was successfully created"
    click_on "Back"
  end

  test "should update Cotization" do
    visit cotization_url(@cotization)
    click_on "Edit this cotization", match: :first

    fill_in "Email", with: @cotization.email
    fill_in "File", with: @cotization.file
    fill_in "Price", with: @cotization.price
    click_on "Update Cotization"

    assert_text "Cotization was successfully updated"
    click_on "Back"
  end

  test "should destroy Cotization" do
    visit cotization_url(@cotization)
    click_on "Destroy this cotization", match: :first

    assert_text "Cotization was successfully destroyed"
  end
end
