require "application_system_test_case"

class WomenTest < ApplicationSystemTestCase
  setup do
    @woman = women(:one)
  end

  test "visiting the index" do
    visit women_url
    assert_selector "h1", text: "Women"
  end

  test "creating a Woman" do
    visit women_url
    click_on "New Woman"

    click_on "Create Woman"

    assert_text "Woman was successfully created"
    click_on "Back"
  end

  test "updating a Woman" do
    visit women_url
    click_on "Edit", match: :first

    click_on "Update Woman"

    assert_text "Woman was successfully updated"
    click_on "Back"
  end

  test "destroying a Woman" do
    visit women_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Woman was successfully destroyed"
  end
end
