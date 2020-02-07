class ArtistsController < ApplicationController
    def new
        @model = Artist.new
    end
    def show
        @model = Artist.find(params[:id])
    end
    def create
        @model = Artist.create(artist_params(:name, :bio))
        redirect_to artist_path(@model)
    end
    def edit
        @model = Artist.find(params[:id])
    end
    def index
        @models = Artist.all
    end
    def update
        @model = Artist.find(params[:id])
        @model.update(artist_params(:name,:bio))
        redirect_to artist_path(@model)
    end
    private
    def artist_params(*args)
        params.require(:artist).permit(*args)
    end
end
