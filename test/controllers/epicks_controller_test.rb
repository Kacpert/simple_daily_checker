require "test_helper"

class EpicksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @epick = epicks(:one)
  end

  test "should get index" do
    get epicks_url
    assert_response :success
  end

  test "should get new" do
    get new_epick_url
    assert_response :success
  end

  test "should create epick" do
    assert_difference('Epick.count') do
      post epicks_url, params: { epick: { name: @epick.name, status: @epick.status } }
    end

    assert_redirected_to epick_url(Epick.last)
  end

  test "should show epick" do
    get epick_url(@epick)
    assert_response :success
  end

  test "should get edit" do
    get edit_epick_url(@epick)
    assert_response :success
  end

  test "should update epick" do
    patch epick_url(@epick), params: { epick: { name: @epick.name, status: @epick.status } }
    assert_redirected_to epick_url(@epick)
  end

  test "should destroy epick" do
    assert_difference('Epick.count', -1) do
      delete epick_url(@epick)
    end

    assert_redirected_to epicks_url
  end
end
