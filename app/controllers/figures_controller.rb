class FiguresController < ApplicationController

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
      if !params["landmark"]["name"].empty?
        @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
      end
      @figure.save
      redirect "/figure/#{@figure.id}"
    end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params[""]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmarks"]["name"])
    end
    redirect to "/figure/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    #redirect "/figure/#{@figure.id}" ?
    erb :'figures/show'
  end

  #figure - title name
  #figure - landmark name

end
