require "test_helper"

class FoodPacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_pack = food_packs(:one)
  end

  test "should get index" do
    get food_packs_url
    assert_response :success
  end

  test "should get new" do
    get new_food_pack_url
    assert_response :success
  end

  test "should create food_pack" do
    assert_difference("FoodPack.count") do
      post food_packs_url, params: { food_pack: { name: @food_pack.name, protein_id: @food_pack.protein_id } }
    end

    assert_redirected_to food_pack_url(FoodPack.last)
  end

  test "should show food_pack" do
    get food_pack_url(@food_pack)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_pack_url(@food_pack)
    assert_response :success
  end

  test "should update food_pack" do
    patch food_pack_url(@food_pack), params: { food_pack: { name: @food_pack.name, protein_id: @food_pack.protein_id } }
    assert_redirected_to food_pack_url(@food_pack)
  end

  test "should destroy food_pack" do
    assert_difference("FoodPack.count", -1) do
      delete food_pack_url(@food_pack)
    end

    assert_redirected_to food_packs_url
  end
end
