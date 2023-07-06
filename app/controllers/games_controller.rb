class GamesController < ApplicationController
  def index
		@games = Game.all
	end

  def show
    @game = Game.find(params[:id])
  end
	
	def new
		@game = Game.new
	end
	
	def create
		@game = Game.new(game_params)
		if @game.save
			redirect_to games_path, notice: 'Игра успешно добавлена'
		else
			render :new
		end
	end
	
	def edit
		@game = Game.find(params[:id])
	end
	
	def update
		@game = Game.find(params[:id])
		if @game.update(game_params)
			redirect_to games_path, notice: 'Игра успешно обновлена'
		else
			render :edit
		end
	end
	
	def destroy
		@game = Game.find(params[:id])
		@game.destroy
		redirect_to games_path, notice: 'Игра успешно удалена'
	end
	
	private
	
	def game_params
		params.require(:game).permit(:title, :description, :release_date, :req_cpu_core_count, :req_cpu_thread_count, :req_cpu_clock, :req_cpu_cache, :req_gpu_memory, :req_gpu_core_clock, :req_gpu_bus_width, :req_hdd_capacity, :req_ram_memory, :req_ssd_capacity, :image, :min_budget)
	end
end
