class ComponentsController < ApplicationController

  def index
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
