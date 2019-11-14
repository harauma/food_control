require 'test_helper'

class IngredientControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ingredient_new_url
    assert_response :success
  end

end
