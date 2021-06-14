class ArgumentsController < ApplicationController
  before_action :set_argument, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:show, :index]
  after_action :verify_authorized
  
  # GET /arguments or /arguments.json
  def index
  	authorize Argument
    @arguments = Argument.where(argument_id: nil)
  end

  # GET /arguments/1 or /arguments/1.json
  def show
  	authorize @argument
  end

  # GET /arguments/new
  def new
  	authorize Argument
    @argument = Argument.new( 
      argument_id: params[:reply], 
      reply_type: params[:reply_type]
    )
  end

  # GET /arguments/1/edit
  def edit
    authorize @argument
  end

  # POST /arguments or /arguments.json
  def create
  	authorize Argument
    @argument = current_user.arguments.new(argument_params)
    if @argument.save
      @argument.send_reply_notification!
      redirect_to @argument, notice: 'Argument was successfully created.'        
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /arguments/1 or /arguments/1.json
  def update
    authorize @argument
    if @argument.update(argument_params)
      redirect_to @argument, notice: 'Argument was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /arguments/1 or /arguments/1.json
  def destroy
    authorize @argument
    @argument.destroy
    redirect_to arguments_url, notice: 'Argument was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_argument
    @argument = Argument.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def argument_params
    params.require(:argument).permit(:title, :body, :argument_id, :reply_type)
  end
end
