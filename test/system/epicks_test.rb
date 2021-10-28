require "application_system_test_case"

class EpicksTest < ApplicationSystemTestCase
  setup do
    @epick = epicks(:one)
  end

  test "visiting the index" do
    visit epicks_url
    assert_selector "h1", text: "Epicks"
  end

  test "creating a Epick" do
    visit epicks_url
    click_on "New Epick"

    fill_in "Name", with: @epick.name
    check "Status" if @epick.status
    click_on "Create Epick"

    assert_text "Epick was successfully created"
    click_on "Back"
  end

  test "updating a Epick" do
    visit epicks_url
    click_on "Edit", match: :first

    fill_in "Name", with: @epick.name
    check "Status" if @epick.status
    click_on "Update Epick"

    assert_text "Epick was successfully updated"
    click_on "Back"
  end

  test "destroying a Epick" do
    visit epicks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Epick was successfully destroyed"
  end
end
