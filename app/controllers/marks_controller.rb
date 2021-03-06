class MarksController < ApplicationController
  before_action :authenticate_teacher!, only: [:new, :show, :edit, :update, :destroy] 
  before_action :set_mark, only: [:show, :edit, :update, :destroy]

  # GET /marks
  # GET /marks.json
  def index
    if(current_teacher.present?)
    @marks = current_teacher.marks
  elsif (current_student.present?)
    @marks = current_student.marks
      end
  end

  # GET /marks/1
  # GET /marks/1.json
  def show
  end

  # GET /marks/new
  def new
    @mark = Mark.new
  end

  # GET /marks/1/edit
  def edit
  end

  # POST /marks
  # POST /marks.json
  def create
    @mark = Mark.new(mark_params)
    @mark.teacher_id = current_teacher.id
    respond_to do |format|
      if @mark.save
        format.html { redirect_to @mark, notice: 'Marks was successfully created.' }
        format.json { render :show, status: :created, location: @mark }
      else
        format.html { render :new }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marks/1
  # PATCH/PUT /marks/1.json
  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.html { redirect_to @mark, notice: 'Marks was successfully updated.' }
        format.json { render :show, status: :ok, location: @mark }
      else
        format.html { render :edit }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marks/1
  # DELETE /marks/1.json
  def destroy
    @mark.destroy
    respond_to do |format|
      format.html { redirect_to marks_url, notice: 'Marks was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def import
    if params[:file].nil?
    redirect_to marks_path, alert: "CSV document not present."
    else
    Mark.import(params[:file],current_teacher)
    redirect_to marks_path, notice: "Marks Added Successfully"
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark
      @mark = Mark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mark_params
      params.require(:mark).permit(:marks, :student_id,)
    end
end
