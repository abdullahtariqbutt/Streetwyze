require "application_system_test_case"

class AssestsTest < ApplicationSystemTestCase
  setup do
    @assest = assests(:one)
  end

  test "visiting the index" do
    visit assests_url
    assert_selector "h1", text: "Assests"
  end

  test "creating a Assest" do
    visit assests_url
    click_on "New Assest"

    fill_in "Address", with: @assest.address
    fill_in "Category", with: @assest.category
    check "Leave rating" if @assest.leave_rating
    fill_in "Name", with: @assest.name
    fill_in "Rating", with: @assest.rating
    fill_in "Story", with: @assest.story
    fill_in "Stuff type", with: @assest.stuff_type
    click_on "Create Assest"

    assert_text "Assest was successfully created"
    click_on "Back"
  end

  test "updating a Assest" do
    visit assests_url
    click_on "Edit", match: :first

    fill_in "Address", with: @assest.address
    fill_in "Category", with: @assest.category
    check "Leave rating" if @assest.leave_rating
    fill_in "Name", with: @assest.name
    fill_in "Rating", with: @assest.rating
    fill_in "Story", with: @assest.story
    fill_in "Stuff type", with: @assest.stuff_type
    click_on "Update Assest"

    assert_text "Assest was successfully updated"
    click_on "Back"
  end

  test "destroying a Assest" do
    visit assests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assest was successfully destroyed"
  end
end
