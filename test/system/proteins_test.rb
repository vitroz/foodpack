require "application_system_test_case"

class ProteinsTest < ApplicationSystemTestCase
  setup do
    @protein = proteins(:one)
  end

  test "visiting the index" do
    visit proteins_url
    assert_selector "h1", text: "Proteins"
  end

  test "should create protein" do
    visit proteins_url
    click_on "New protein"

    fill_in "Name", with: @protein.name
    click_on "Create Protein"

    assert_text "Protein was successfully created"
    click_on "Back"
  end

  test "should update Protein" do
    visit protein_url(@protein)
    click_on "Edit this protein", match: :first

    fill_in "Name", with: @protein.name
    click_on "Update Protein"

    assert_text "Protein was successfully updated"
    click_on "Back"
  end

  test "should destroy Protein" do
    visit protein_url(@protein)
    click_on "Destroy this protein", match: :first

    assert_text "Protein was successfully destroyed"
  end
end
