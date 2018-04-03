require 'test_helper'

class NoticiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @noticium = noticia(:one)
  end

  test "should get index" do
    get noticia_url
    assert_response :success
  end

  test "should get new" do
    get new_noticium_url
    assert_response :success
  end

  test "should create noticium" do
    assert_difference('Noticium.count') do
      post noticia_url, params: { noticium: { bajada: @noticium.bajada, cuerpo: @noticium.cuerpo, fecha: @noticium.fecha, titular: @noticium.titular } }
    end

    assert_redirected_to noticium_url(Noticium.last)
  end

  test "should show noticium" do
    get noticium_url(@noticium)
    assert_response :success
  end

  test "should get edit" do
    get edit_noticium_url(@noticium)
    assert_response :success
  end

  test "should update noticium" do
    patch noticium_url(@noticium), params: { noticium: { bajada: @noticium.bajada, cuerpo: @noticium.cuerpo, fecha: @noticium.fecha, titular: @noticium.titular } }
    assert_redirected_to noticium_url(@noticium)
  end

  test "should destroy noticium" do
    assert_difference('Noticium.count', -1) do
      delete noticium_url(@noticium)
    end

    assert_redirected_to noticia_url
  end
end
