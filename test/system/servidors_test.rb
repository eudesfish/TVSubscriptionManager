require "application_system_test_case"

class ServidorsTest < ApplicationSystemTestCase
  setup do
    @servidor = servidors(:one)
  end

  test "visiting the index" do
    visit servidors_url
    assert_selector "h1", text: "Servidors"
  end

  test "should create servidor" do
    visit servidors_url
    click_on "New servidor"

    fill_in "Nome", with: @servidor.nome
    fill_in "Tipo", with: @servidor.tipo
    click_on "Create Servidor"

    assert_text "Servidor was successfully created"
    click_on "Back"
  end

  test "should update Servidor" do
    visit servidor_url(@servidor)
    click_on "Edit this servidor", match: :first

    fill_in "Nome", with: @servidor.nome
    fill_in "Tipo", with: @servidor.tipo
    click_on "Update Servidor"

    assert_text "Servidor was successfully updated"
    click_on "Back"
  end

  test "should destroy Servidor" do
    visit servidor_url(@servidor)
    click_on "Destroy this servidor", match: :first

    assert_text "Servidor was successfully destroyed"
  end
end
