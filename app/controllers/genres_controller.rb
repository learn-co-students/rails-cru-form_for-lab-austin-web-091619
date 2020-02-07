class GenresController < ApplicationController
    def new
        @model = Genre.new
    end
    def show
        @model = Genre.find(params[:id])
    end
    def create
        @model = Genre.create(genre_params(:name))
        redirect_to genre_path(@model)
    end
    def edit
        @model = Genre.find(params[:id])
    end
    def index
        @models = Genre.all
    end
    def update
        @model = Genre.find(params[:id])
        @model.update(genre_params(:name))
        redirect_to genre_path(@model)
    end
    private
    def genre_params(*args)
        params.require(:genre).permit(*args)
    end
end