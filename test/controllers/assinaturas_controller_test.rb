require "test_helper"

class AssinaturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assinatura = assinaturas(:one)
  end

  test "should get index" do
    get assinaturas_url
    assert_response :success
  end

  test "should get new" do
    get new_assinatura_url
    assert_response :success
  end

  test "should create assinatura" do
    assert_difference("Assinatura.count") do
      post assinaturas_url, params: { assinatura: { cliente_id: @assinatura.cliente_id, data_inicio: @assinatura.data_inicio, data_vencimento: @assinatura.data_vencimento, observacoes: @assinatura.observacoes, servidor_id: @assinatura.servidor_id, status: @assinatura.status } }
    end

    assert_redirected_to assinatura_url(Assinatura.last)
  end

  test "should show assinatura" do
    get assinatura_url(@assinatura)
    assert_response :success
  end

  test "should get edit" do
    get edit_assinatura_url(@assinatura)
    assert_response :success
  end

  test "should update assinatura" do
    patch assinatura_url(@assinatura), params: { assinatura: { cliente_id: @assinatura.cliente_id, data_inicio: @assinatura.data_inicio, data_vencimento: @assinatura.data_vencimento, observacoes: @assinatura.observacoes, servidor_id: @assinatura.servidor_id, status: @assinatura.status } }
    assert_redirected_to assinatura_url(@assinatura)
  end

  test "should destroy assinatura" do
    assert_difference("Assinatura.count", -1) do
      delete assinatura_url(@assinatura)
    end

    assert_redirected_to assinaturas_url
  end
end
