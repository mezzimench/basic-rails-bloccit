require 'test_helper'

class AdvertisementControllerTest < ActionController::TestCase
  test "should get title:string," do
    get :title:string,
    assert_response :success
  end

  test "should get copy:text," do
    get :copy:text,
    assert_response :success
  end

  test "should get price:integer" do
    get :price:integer
    assert_response :success
  end

end
