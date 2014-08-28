class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  
  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all
    @content = Content.new
  end
  def index_content
    @contents = Content.all
    @content = Content.new
  end
  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def sendmail
    UserMail.send_attach(params[:emailid],params[:bdy],params[:attach]).deliver
    flash[:notice] = 'E-mail was delivered successfully '
    redirect_to root_path
  end

  # POST /contents
  # POST /contents.json
  def create
   
    @filename = params[:content][:path].original_filename
    @data = params[:content][:path]
    # write the file
    File.open(Rails.root.join('public', 'uploads', @filename), 'wb') do |file|
    file.write(@data.read)
    end
    @content = Content.new(:path => @filename)
    @contents = Content.all
   
    if @content.save
    else
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    @filename = params[:content][:path].original_filename
    @data = params[:content][:path]
    # write the file
    File.open(Rails.root.join('public', 'uploads', @filename), 'wb') do |file|
     file.write(@data.read)
    end
    respond_to do |format|
      if @content.update(:path => @filename)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    delet=@content.path
    @content.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
    if File.exists?("#{Rails.root}/public/uploads/#{delet}")
      File.delete("#{Rails.root}/public/uploads/#{delet}")
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:path)
    end
end
