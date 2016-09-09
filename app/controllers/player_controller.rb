class PlayerController < ApplicationController

	def index
		@players = Player.all
	end

	def new
		@player = Player.new
		respond_to do |format|
	      format.html
	      format.js
	    end
	end

	def create
		@player = Player.new(params[:player].permit(:name))
		puts "PARAMETROS: " << params.inspect
		respond_to do |format|
	      if @player.save
	      	flash[:success] = 'Se ha creado jugador'
	        #format.js { render "create" }
	        format.html { redirect_to home_path()}#, notice: 'Task was successfully created.' }
	        #format.json { render json: @player, status: :created, location: @player }
	      else
	        #format.html { redirect_to boards_project_path(@task.project_id), status: :unprocessable_entity }
	        format.js { render "error"}
	        format.json { render json: @player.errors, status: :unprocessable_entity }
	      end
	    end
	end

end
