Rails.application.routes.draw do
  # Rota para autenticação de usuários utilizando Devise
  devise_for :users

  # Define a rota raiz do projeto para o Dashboard
  root to: 'dashboard#index'

  # Recursos para Clientes
  resources :clientes

  # Recursos para Servidores
  resources :servidors

  # Recursos para Assinaturas com rota customizada para Pagamento
  resources :assinaturas do
    member do
      # Utilize GET para exibir o formulário de pagamento
      get 'pagamento', to: 'assinaturas#pagamento'
      # Utilize POST para confirmar o pagamento e salvar as alterações
      post 'confirmar_pagamento', to: 'assinaturas#confirmar_pagamento'
      
    end
  end

  # Rota para Relatórios
  get 'relatorio', to: 'relatorios#index'

  # Rota para o Dashboard (já definida como root, mas pode ser acessada diretamente)
  get 'dashboard', to: 'dashboard#index'

  # Rota para o Financeiro
  get 'financeiro', to: 'financeiro#index'
end
