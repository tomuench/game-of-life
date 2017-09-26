class CellsController < ApplicationController
  before_action :set_cell

  # Aktiviert oder deaktiviert eine celle
  # PUT /cells/:id/toggle
  def toggle
    logger.info "Toggeling Cell ##{@cell.id}"
    respond_to do |format|
      if @cell.life_toggle
        format.html { render :show }
        format.json { render :show, status: :ok, location: @cell }
      else
        format.html { render :show }
        format.json { render json: @cell.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_cell
    @cell = Cell.find(params[:id])
  end
end
