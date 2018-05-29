require "application_system_test_case"

class MenTest < ApplicationSystemTestCase
  setup do
    @man = men(:one)
  end

  test "visiting the index" do
    visit men_url
    assert_selector "h1", text: "Men"
  end

  test "creating a Man" do
    visit men_url
    click_on "New Man"

    click_on "Create Man"

    assert_text "Man was successfully created"
    click_on "Back"
  end

  test "updating a Man" do
    visit men_url
    click_on "Edit", match: :first

    click_on "Update Man"

    assert_text "Man was successfully updated"
    click_on "Back"
  end

  test "destroying a Man" do
    visit men_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Man was successfully destroyed"
  end
end
