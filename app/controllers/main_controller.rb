# frozen_string_literal: true

class MainController < ApplicationController

  def index
    @home_page = ::HomePageContent.new
  end

  def catalogue
    @ssds = Ssd.all
    @rigs = Rig.all
    @rams = Ram.all
    @power_supplies = PowerSupply.all
    @motherboards = Motherboard.all
    @hdds = Hdd.all
    @gpus = Gpu.all
    @games = Game.all
    @cpus = Cpu.all
    @coolers = Cooler.all
  end

end
