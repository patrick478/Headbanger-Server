class SongListensController < ApplicationController
  before_action :set_song_listen, only: [:show, :edit, :update, :destroy]

  # GET /song_listens
  # GET /song_listens.json
  def index
    @song_listens = SongListen.all
  end

  # GET /song_listens/1
  # GET /song_listens/1.json
  def show
  end

  # GET /song_listens/new
  def new
    @song_listen = SongListen.new
    if Song.find_by(title: params[:title], artist: params[:artist], album: params[:album]).first.present?
      @song_listen.song = Song.find_by(title: params[:title], artist: params[:artist], album: params[:album]).first
    else
      @song_listen.song = Song.create(title: params[:title], artist: params[:artist], album: params[:album])
    end

    if User.find_by(facebook_id: params[:facebook_id]).first.present?
      @song_listen.user = User.find_by(facebook_id: params[:facebook_id]).first
    end

  end

  # GET /song_listens/1/edit
  def edit
  end

  # POST /song_listens
  # POST /song_listens.json
  def create
    @song_listen = SongListen.new(song_listen_params)

    respond_to do |format|
      if @song_listen.save
        format.html { redirect_to @song_listen, notice: 'Song listen was successfully created.' }
        format.json { render :show, status: :created, location: @song_listen }
      else
        format.html { render :new }
        format.json { render json: @song_listen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /song_listens/1
  # PATCH/PUT /song_listens/1.json
  def update
    respond_to do |format|
      if @song_listen.update(song_listen_params)
        format.html { redirect_to @song_listen, notice: 'Song listen was successfully updated.' }
        format.json { render :show, status: :ok, location: @song_listen }
      else
        format.html { render :edit }
        format.json { render json: @song_listen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_listens/1
  # DELETE /song_listens/1.json
  def destroy
    @song_listen.destroy
    respond_to do |format|
      format.html { redirect_to song_listens_url, notice: 'Song listen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song_listen
      @song_listen = SongListen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_listen_params
      params.require(:song_listen).permit(:title, :artist, :album, :facebook_id, :nods, :location)
    end
end
