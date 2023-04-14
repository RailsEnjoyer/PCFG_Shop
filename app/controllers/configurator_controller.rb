class ConfiguratorController < ApplicationController
  def index
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

  def show
  end
end
