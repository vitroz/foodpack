require "application_system_test_case"

class FoodPacksTest < ApplicationSystemTestCase
  setup do
    @food_pack = food_packs(:one)
  end

  test "visiting the index" do
    visit food_packs_url
    assert_selector "h1", text: "Food packs"
  end

  test "should create food pack" do
    visit food_packs_url
    click_on "New food pack"

    fill_in "Name", with: @food_pack.name
    fill_in "Protein", with: @food_pack.protein_id
    click_on "Create Food pack"

    assert_text "Food pack was successfully created"
    click_on "Back"
  end

  test "should update Food pack" do
    visit food_pack_url(@food_pack)
    click_on "Edit this food pack", match: :first

    fill_in "Name", with: @food_pack.name
    fill_in "Protein", with: @food_pack.protein_id
    click_on "Update Food pack"

    assert_text "Food pack was successfully updated"
    click_on "Back"
  end

  test "should destroy Food pack" do
    visit food_pack_url(@food_pack)
    click_on "Destroy this food pack", match: :first

    assert_text "Food pack was successfully destroyed"
  end
end
