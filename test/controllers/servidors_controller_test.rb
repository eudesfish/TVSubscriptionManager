require "test_helper"

class ServidorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @servidor = servidors(:one)
  end

  test "should get index" do
    get servidors_url
    assert_response :success
  end

  test "should get new" do
    get new_servidor_url
    assert_response :success
  end

  test "should create servidor" do
    assert_difference("Servidor.count") do
      post servidors_url, params: { servidor: { nome: @servidor.nome, tipo: @servidor.tipo } }
    end

    assert_redirected_to servidor_url(Servidor.last)
  end

  test "should show servidor" do
    get servidor_url(@servidor)
    assert_response :success
  end

  test "should get edit" do
    get edit_servidor_url(@servidor)
    assert_response :success
  end

  test "should update servidor" do
    patch servidor_url(@servidor), params: { servidor: { nome: @servidor.nome, tipo: @servidor.tipo } }
    assert_redirected_to servidor_url(@servidor)
  end

  test "should destroy servidor" do
    assert_difference("Servidor.count", -1) do
      delete servidor_url(@servidor)
    end

    assert_redirected_to servidors_url
  end
end
