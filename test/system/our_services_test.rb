require "application_system_test_case"

class OurServicesTest < ApplicationSystemTestCase
  setup do
    @our_service = our_services(:one)
  end

  test "visiting the index" do
    visit our_services_url
    assert_selector "h1", text: "Our Services"
  end

  test "creating a Our service" do
    visit our_services_url
    click_on "New Our Service"

    click_on "Create Our service"

    assert_text "Our service was successfully created"
    click_on "Back"
  end

  test "updating a Our service" do
    visit our_services_url
    click_on "Edit", match: :first

    click_on "Update Our service"

    assert_text "Our service was successfully updated"
    click_on "Back"
  end

  test "destroying a Our service" do
    visit our_services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Our service was successfully destroyed"
  end
end
