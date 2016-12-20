class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:landmark][:name].length > 0
      @figure.landmark << landmark[:name]
    end
    if params[:title][:name].length > 0
      @figure.title << params[:title][:name]
    end
    @figure.save
    redirect "/figure/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
end
