class ConfiguratorController < ApplicationController
  def step1
    @games = Game.all
  end

  def step1_submit
    session[:selected_game_id] = params[:selected_game_id]
    redirect_to step2_path
  end
  
  def step2
  end

  def step2_submit
    session[:budget] = params[:budget]
    redirect_to step3_path
  end
  
  def step3
  end

  def step3_submit
    session[:selected_budget] = params[:budget]
    session[:selected_manufacturer] = params[:manufacturer]
    session[:selected_has_rig] = params[:has_rig] == '1'
    session[:selected_storage_type] = params[:storage_type]
    redirect_to results_path
  end

  
  def results
    @selected_game = Game.find(session[:selected_game_id])
    @selected_budget = session[:budget].to_f
    @selected_storage = session[:selected_storage_type]
    @selected_manufacturer = session[:selected_manufacturer]
    @selected_rig = session[:selected_has_rig]

    @cpus = Cpu.all
    @coolers = Cooler.all
    @gpus = Gpu.all
    @hdds = Hdd.all
    @motherboards = Motherboard.all
    @power_supplies = PowerSupply.all
    @rams = Ram.all
    @rigs = Rig.all
    @ssds = Ssd.all

    @ready_cpu = @cpus.where(
      'core_count >= ? 
      AND thread_count >=? 
      AND boost_clock >=?
      AND price <=?', 
      @selected_game.req_cpu_core_count,
      @selected_game.req_cpu_thread_count,
      @selected_game.req_cpu_clock,
      @selected_budget * 0.2
    )

    @ready_cpu = @ready_cpu.order(
      "core_count DESC, thread_count DESC, boost_clock DESC"
    )


    @ready_gpu = @gpus.where(
      'memory >= ? 
      AND boost_clock >=? 
      AND bus_width >=?
      AND price <=?', 
      @selected_game.req_gpu_memory,
      @selected_game.req_gpu_core_clock,
      @selected_game.req_gpu_bus_width,
      @selected_budget * 0.3
    )

    @ready_gpu = @ready_gpu.order(
      "memory DESC, boost_clock DESC, bus_width DESC"
    )
    

    @ready_hdd = @hdds.where(
      'capacity >= ? 
      AND price <=?', 
      @selected_game.req_hdd_capacity,
      @selected_budget * 0.2
    )

    @ready_hdd = @ready_hdd.order(
      "speed DESC, rpm DESC, capacity DESC"
    )
    

    @ready_ssd = @ssds.where(
      'capacity >= ?
      AND price <=?', 
      @selected_game.req_ssd_capacity,
      @selected_budget * 0.2
    )

    @ready_ssd = @ready_ssd.order(
      "write_speed DESC, read_speed DESC, operating_time DESC"
    )
    

    @ready_ram = @rams.where(
      'memory >= ? 
      AND price <= ?', 
      @selected_game.req_ram_memory,
      @selected_budget * 0.1
    )

    @ready_ram = @ready_ram.order(
      "memory_speed DESC, timings DESC"
    )
    

    compatible_sockets = @ready_cpu.first.compatible_socket.split(',')
    @ready_motherboard = @motherboards.where(
      'memory_type == ?
       AND memory_clock >= ?
       AND price <=?
       AND socket == ?
       AND (memory_type == ? OR memory_type IN (?))',
      
      @ready_ram.first.memory_type,
      @ready_ram.first.memory_speed,
      @selected_budget * 0.3,
      @ready_cpu.first.socket,
      @ready_cpu.first.compatible_socket, compatible_sockets
      
    )
    


    @ready_power_supply = @power_supplies.where(
      'wattage >= ?
      AND price <= ?',
      @ready_gpu.first.tdp,
      @selected_budget * 0.05
    )

    @ready_power_supply = @ready_power_supply.order(
      "efficiency DESC, wattage DESC"
    )

  
    @ready_cooler_by_socket = @coolers.where(
      'socket LIKE ?
      AND price <= ?',
      "%#{@ready_cpu.first.socket}%",
      @selected_budget * 0.05
    )

    @ready_coolers = @ready_cooler_by_socket.order(
      "max_tdp DESC"
    )
    

    @ready_rig = @rigs.where(
      'price <= ?',
      @selected_budget * 0.05
    )

    @ready_rig = @ready_rig.order(
      "drive_bays DESC, rating DESC"
    )

    @top_3_graphic_cards = @ready_gpu.take(1)
    @top_3_hdds = @ready_hdd.take(1)
    @top_3_ssds = @ready_ssd.take(1)
    @top_3_rams = @ready_ram.take(1)
    @top_3_motherboards = @ready_motherboard.take(1)
    @top_3_power_supplies = @ready_power_supply.take(1)
    @top_3_coolers = @ready_coolers.take(1)
    @top_3_rigs = @ready_rig.take(1)
    @top_3_processors = @ready_cpu.take(1)
    
    @total_price = (@top_3_power_supplies.first.price + @top_3_motherboards.first.price + @top_3_rams.first.price + @top_3_ssds.first.price + @top_3_hdds.first.price + @top_3_graphic_cards.first.price + @top_3_processors.first.price)*1.15 + 30
    @rounded_price = @total_price.round(2)
    @added_price = @top_3_coolers.first.price + @top_3_rigs.first.price 
    @rounded_added_price = @added_price.round(2)
  end
end
