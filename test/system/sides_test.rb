require "application_system_test_case"

class SidesTest < ApplicationSystemTestCase
  setup do
    @side = sides(:one)
  end

  test "visiting the index" do
    visit sides_url
    assert_selector "h1", text: "Sides"
  end

  test "should create side" do
    visit sides_url
    click_on "New side"

    fill_in "Name", with: @side.name
    click_on "Create Side"

    assert_text "Side was successfully created"
    click_on "Back"
  end

  test "should update Side" do
    visit side_url(@side)
    click_on "Edit this side", match: :first

    fill_in "Name", with: @side.name
    click_on "Update Side"

    assert_text "Side was successfully updated"
    click_on "Back"
  end

  test "should destroy Side" do
    visit side_url(@side)
    click_on "Destroy this side", match: :first

    assert_text "Side was successfully destroyed"
  end
end
