require 'date'
class AllisButtonsController < ApplicationController
  before_action :set_allis_button, only: [:show, :edit, :update, :destroy]

  # GET /allis_buttons
  # GET /allis_buttons.json
  def index
    @allis_buttons = AllisButton.all
  end

  # GET /allis_buttons/1
  # GET /allis_buttons/1.json
  def show
  end

  # GET /allis_buttons/new
  def new
    @allis_button = AllisButton.new
  end

  # GET /allis_buttons/1/edit
  def edit
  end
  def getTaskName(user_id, allis_button_id)
    'abc_'+ user_id.to_s + '_' + allis_button_id.to_s #change to {} format
  end
  # POST /allis_buttons
  # POST /allis_buttons.json
  def create
    @allis_button = AllisButton.new(allis_button_params)

    respond_to do |format|
      if @allis_button.save
        format.html { redirect_to @allis_button, notice: 'Allis button was successfully created.' }
        format.json { render :show, status: :created, location: @allis_button }
        #
        @user = User.find_by(id: @allis_button.user_id)
        name = self.getTaskName(@user.id, @allis_button.id)
        
        #config = {}
        #config[:queue] = 'AllisButtonCreated'
        #config[:class] = 'SendEmailJob'
        #config[:args] = @user.email
        #config[:every] = ['2m', {first_in: 10.seconds}]
        #config[:persist] = true
        #config[:verify_ssl] = false
    
        #Resque.set_schedule(name, config)
        #
        logger.info "I am trying to send an email trough a queue to:" + @user.email
        Resque.enqueue_in_with_queue('AllisButtonCreated',0.seconds, SendEmailJob, @user.email)
      else
        format.html { render :new }
        format.json { render json: @allis_button.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allis_buttons/1
  # PATCH/PUT /allis_buttons/1.json
  def update
    respond_to do |format|
      case params.require(:allis_button).permit(:update_action)[:update_action]
      when "check_only"
        @allis_button[:udate_date] = DateTime.now
        notice =  'Allis button was successfully checked.' + ' Time: ' + @allis_button[:udate_date].to_s
      else
        notice = 'Allis button was successfully updated.'
      end

      if @allis_button.update(allis_button_params)
        format.html { redirect_to @allis_button, notice: notice}
        format.json { render :show, status: :ok, location: @allis_button }
      else
        format.html { render :edit }
        format.json { render json: @allis_button.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allis_buttons/1
  # DELETE /allis_buttons/1.json
  def destroy
    @allis_button.destroy
    respond_to do |format|
      format.html { redirect_to allis_buttons_url, notice: 'Allis button was successfully destroyed.' }
      format.json { head :no_content }
    end
    name = self.getTaskName(@allis_button.user_id, @allis_button.id)
    Resque.remove_schedule(name)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allis_button
      @allis_button = AllisButton.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allis_button_params
      params.require(:allis_button).permit(:user_id, :word, :start_date, :udate_date, :interval, :subject_warning, :message_warning, :eml_warning, :style)
    end
end
