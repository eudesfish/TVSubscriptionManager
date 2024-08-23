require "application_system_test_case"

class AssinaturasTest < ApplicationSystemTestCase
  setup do
    @assinatura = assinaturas(:one)
  end

  test "visiting the index" do
    visit assinaturas_url
    assert_selector "h1", text: "Assinaturas"
  end

  test "should create assinatura" do
    visit assinaturas_url
    click_on "New assinatura"

    fill_in "Cliente", with: @assinatura.cliente_id
    fill_in "Data inicio", with: @assinatura.data_inicio
    fill_in "Data vencimento", with: @assinatura.data_vencimento
    fill_in "Observacoes", with: @assinatura.observacoes
    fill_in "Servidor", with: @assinatura.servidor_id
    fill_in "Status", with: @assinatura.status
    click_on "Create Assinatura"

    assert_text "Assinatura was successfully created"
    click_on "Back"
  end

  test "should update Assinatura" do
    visit assinatura_url(@assinatura)
    click_on "Edit this assinatura", match: :first

    fill_in "Cliente", with: @assinatura.cliente_id
    fill_in "Data inicio", with: @assinatura.data_inicio
    fill_in "Data vencimento", with: @assinatura.data_vencimento
    fill_in "Observacoes", with: @assinatura.observacoes
    fill_in "Servidor", with: @assinatura.servidor_id
    fill_in "Status", with: @assinatura.status
    click_on "Update Assinatura"

    assert_text "Assinatura was successfully updated"
    click_on "Back"
  end

  test "should destroy Assinatura" do
    visit assinatura_url(@assinatura)
    click_on "Destroy this assinatura", match: :first

    assert_text "Assinatura was successfully destroyed"
  end
end
