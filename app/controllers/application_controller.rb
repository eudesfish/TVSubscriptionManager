class ApplicationController < ActionController::Base
    def relatorio
        @assinaturas = Assinatura.all
      
        respond_to do |format|
          format.html
          format.pdf do
            pdf = Prawn::Document.new
            pdf.text "Relatório de Assinaturas", size: 30, style: :bold
            pdf.move_down 20
      
            @assinaturas.each do |assinatura|
              pdf.text "Cliente: #{assinatura.cliente.nome} | Servidor: #{assinatura.servidor.nome} | Status: #{assinatura.status}"
              pdf.move_down 10
            end
      
            send_data pdf.render, filename: "relatorio_assinaturas.pdf", type: "application/pdf", disposition: "inline"
          end
        end
    end
    
    def pagamento
      @assinatura.update(data_inicio: params[:data_inicio], data_vencimento: params[:data_inicio].to_date + 30.days)

      respond_to do |format|
        if @assinatura.save
          format.html { redirect_to assinaturas_path, notice: 'Pagamento realizado com sucesso.' }
          format.json { render :show, status: :ok, location: @assinatura }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @assinatura.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def realizar_pagamento
      @assinatura = Assinatura.find(params[:id])
      if @assinatura.update(data_inicio: params[:data_inicio], data_pagamento: params[:data_pagamento])
        redirect_to assinaturas_path, notice: 'Pagamento realizado com sucesso.'
      else
        render :pagamento, status: :unprocessable_entity
      end
    end      
end
