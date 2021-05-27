class ArgumentsController < ApplicationController
  before_action :set_argument, only: %i[show edit update destroy]

  # GET /arguments or /arguments.json
  def index
    @arguments = Argument.where(argument_id: nil)
  end

  # GET /arguments/1 or /arguments/1.json
  def show; end

  # GET /arguments/new
  def new
    @argument = Argument.new(
      argument_id: params[:reply],
      reply_type: params[:reply_type]
    )
  end

  # GET /arguments/1/edit
  def edit; end

  # POST /arguments or /arguments.json
  def create
    @argument = Argument.new(argument_params)
    @argument.user = current_user
    respond_to do |format|
      if @argument.save
        format.html { redirect_to @argument, notice: 'Argument was successfully created.' }
        format.json { render :show, status: :created, location: @argument }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @argument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arguments/1 or /arguments/1.json
  def update
    respond_to do |format|
      if @argument.update(argument_params)
        format.html { redirect_to @argument, notice: 'Argument was successfully updated.' }
        format.json { render :show, status: :ok, location: @argument }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @argument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arguments/1 or /arguments/1.json
  def destroy
    @argument.destroy
    respond_to do |format|
      format.html { redirect_to arguments_url, notice: 'Argument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_argument
    @argument = Argument.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def argument_params
    params.require(:argument).permit(:title, :body, :argument_id, :reply_type)
  end
end
