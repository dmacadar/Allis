class AllisButtonStylesController < ApplicationController
  before_action :set_allis_button_style, only: [:show, :edit, :update, :destroy]

  # GET /allis_button_styles
  # GET /allis_button_styles.json
  def index
    @allis_button_styles = AllisButtonStyle.all
  end

  # GET /allis_button_styles/1
  # GET /allis_button_styles/1.json
  def show
  end

  # GET /allis_button_styles/new
  def new
    @allis_button_style = AllisButtonStyle.new
  end

  # GET /allis_button_styles/1/edit
  def edit
  end

  # POST /allis_button_styles
  # POST /allis_button_styles.json
  def create
    @allis_button_style = AllisButtonStyle.new(allis_button_style_params)

    respond_to do |format|
      if @allis_button_style.save
        format.html { redirect_to @allis_button_style, notice: 'Allis button style was successfully created.' }
        format.json { render :show, status: :created, location: @allis_button_style }
      else
        format.html { render :new }
        format.json { render json: @allis_button_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allis_button_styles/1
  # PATCH/PUT /allis_button_styles/1.json
  def update
    respond_to do |format|
      if @allis_button_style.update(allis_button_style_params)
        format.html { redirect_to @allis_button_style, notice: 'Allis button style was successfully updated.' }
        format.json { render :show, status: :ok, location: @allis_button_style }
      else
        format.html { render :edit }
        format.json { render json: @allis_button_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allis_button_styles/1
  # DELETE /allis_button_styles/1.json
  def destroy
    @allis_button_style.destroy
    respond_to do |format|
      format.html { redirect_to allis_button_styles_url, notice: 'Allis button style was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allis_button_style
      @allis_button_style = AllisButtonStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allis_button_style_params
      params.require(:allis_button_style).permit(:name, :color)
    end
end
