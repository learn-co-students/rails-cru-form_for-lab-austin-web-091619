class SongsController < ApplicationController
    def new
        @model = Song.new
    end
    def show
        @model = Song.find(params[:id])
    end
    def create
        @model = Song.create(song_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@model)
    end
    def edit
        @model = Song.find(params[:id])
    end
    def index
        @models = Song.all
    end
    def update
        @model = Song.find(params[:id])
        @model.update(song_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@model)
    end
    private
    def song_params(*args)
        params.require(:song).permit(*args)
    end
end
