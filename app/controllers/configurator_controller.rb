class ConfiguratorController < ApplicationController
  def step1
    @games = Game.all
    selected_game_ids = params[:game_ids]
    session[:selected_game_ids] = selected_game_ids
  end
  
  def step2
    selected_game_ids = params[:game_ids]
    session[:selected_game_ids] = selected_game_ids
  end
  

  def step3
    selected_game_ids = params[:game_ids]
    session[:selected_game_ids] = selected_game_ids
  end
  
  def results
    @selected_game_ids = session[:selected_game_ids]
    @gpus = Gpu.all
    @cpus = Cpu.all
    @coolers = Cooler.all
    @hdds = Hdd.all
    @motherboards = Motherboard.all
    @power_supplies = PowerSupply.all
    @rams = Ram.all
    @rigs = Rig.all
    @ssds = Ssd.all
  end 
end
