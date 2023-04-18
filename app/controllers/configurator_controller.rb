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
    if params[:budget].present?
      session[:budget] = params[:budget]
    else
      session[:budget] = 10000
    end
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

    @ready_cpu_top = @ready_cpu.order(
      "core_count DESC, thread_count DESC, boost_clock DESC"
    )
    @ready_cpu_low = @ready_cpu.order(
      "price ASC, core_count DESC, thread_count DESC, boost_clock DESC"
    )

    @top_1_processor = @ready_cpu_top.take(1)
    @top_3_processor = @ready_cpu_low.take(1)


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

    @ready_gpu_top = @ready_gpu.order(
      "memory DESC, boost_clock DESC, bus_width DESC"
    )

    @ready_gpu_low = @ready_gpu.order(
      "price ASC, memory DESC, boost_clock DESC, bus_width DESC"
    )
    
    @top_1_graphic_card = @ready_gpu_top.take(1)
    @top_3_graphic_card = @ready_gpu_low.take(1)

    @ready_hdd = @hdds.where(
      'capacity >= ? 
      AND price <=?', 
      @selected_game.req_hdd_capacity,
      @selected_budget * 0.2
    )

    @ready_hdd_top = @ready_hdd.order(
      "speed DESC, rpm DESC, capacity DESC"
    )

    @ready_hdd_low = @ready_hdd.order(
      "price ASC, speed DESC, rpm DESC, capacity DESC"
    )

    @top_1_hdd = @ready_hdd_top.take(1)
    @top_3_hdd = @ready_hdd_low.take(1)
    

    @ready_ssd = @ssds.where(
      'capacity >= ?
      AND price <=?', 
      @selected_game.req_ssd_capacity,
      @selected_budget * 0.2
    )

    @ready_ssd_top = @ready_ssd.order(
      "write_speed DESC, read_speed DESC, operating_time DESC"
    )

    @ready_ssd_low = @ready_ssd.order(
      "price ASC, write_speed DESC, read_speed DESC, operating_time DESC"
    )
    
    @top_1_ssd = @ready_ssd_top.take(1)
    @top_3_ssd = @ready_ssd_low.take(1)

    @ready_ram = @rams.where(
      'memory >= ? 
      AND price <= ?', 
      @selected_game.req_ram_memory,
      @selected_budget * 0.1
    )

    @ready_ram_top = @ready_ram.order(
      "memory_speed DESC, timings DESC"
    )

    @ready_ram_low = @ready_ram.order(
      "price ASC, memory_speed DESC, timings DESC"
    )
    
    @top_1_ram = @ready_ram_top.take(1)
    @top_3_ram = @ready_ram_low.take(1)

    compatible_sockets = @ready_cpu_top.first.compatible_socket.split(',')
    @ready_motherboard = @motherboards.where(
      'memory_type == ?
       AND memory_clock >= ?
       AND price <=?
       AND socket == ?
       AND (memory_type == ? OR memory_type IN (?))',
      
      @ready_ram.first.memory_type,
      @ready_ram.first.memory_speed,
      @selected_budget * 0.3,
      @ready_cpu_top.first.socket,
      @ready_cpu_top.first.compatible_socket, compatible_sockets
      
    )

    @ready_motherboard_top = @ready_motherboard.order(
      "price DESC"
    )

    @ready_motherboard_low = @ready_motherboard.order(
      "price ASC"
    )

    @top_1_motherboard = @ready_motherboard_top.take(1)
    @top_3_motherboard = @ready_motherboard_low.take(1)

    @ready_power_supply = @power_supplies.where(
      'wattage >= ?
      AND price <= ?',
      @ready_gpu_top.first.tdp,
      @selected_budget * 0.05
    )

    @ready_power_supply_top = @ready_power_supply.order(
      "efficiency DESC, wattage DESC"
    )

    @ready_power_supply_low = @ready_power_supply.order(
      "price ASC, efficiency DESC, wattage DESC"
    )

    @top_1_power_supply = @ready_power_supply_top.take(1)
    @top_3_power_supply = @ready_power_supply_low.take(1)

  
    @ready_cooler_by_socket = @coolers.where(
      'socket LIKE ?
      AND price <= ?',
      "%#{@ready_cpu_top.first.socket}%",
      @selected_budget * 0.05
    )

    @ready_coolers_top = @ready_cooler_by_socket.order(
      "max_tdp DESC"
    )

    @ready_coolers_low = @ready_cooler_by_socket.order(
      "price ASC, max_tdp DESC"
    )

    @top_1_cooler = @ready_coolers_top.take(1)
    @top_3_cooler = @ready_coolers_low.take(1)
    

    @ready_rig = @rigs.where(
      'price <= ?',
      @selected_budget * 0.05
    )

    @ready_rig_top = @ready_rig.order(
      "drive_bays DESC, rating DESC"
    )

    @ready_rig_low = @ready_rig.order(
      "price ASC, drive_bays DESC, rating DESC"
    )

    @top_1_rig = @ready_rig_top.take(1)
    @top_3_rig = @ready_rig_low.take(1)
    
    
    missing_components = []
    missing_components << "Power Supply" if @top_1_power_supply.empty?
    missing_components << "Motherboard" if @top_1_motherboard.empty?
    missing_components << "RAM" if @top_1_ram.empty?
    missing_components << "SSD" if @top_1_ssd.empty?
    missing_components << "HDD" if @top_1_hdd.empty?
    missing_components << "Graphics Card" if @top_1_graphic_card.empty?
    missing_components << "Processor" if @top_1_processor.empty?
    missing_components << "Cooler" if @top_1_cooler.empty?
    missing_components << "Rig" if @top_1_rig.empty?

    if missing_components.any?
      @missing_components_string = missing_components.join(", ")
      @missing = @missing_components_string
    else
      @missing = "none"
    end


    @total_price_top = (
      (@top_1_power_supply[0]&.price || 0) + 
      (@top_1_motherboard[0]&.price || 0) + 
      (@top_1_ram[0]&.price || 0) + 
      (@top_1_ssd[0]&.price || 0) + 
      (@top_1_hdd[0]&.price || 0) + 
      (@top_1_graphic_card[0]&.price || 0) + 
      (@top_1_processor[0]&.price || 0)
    ) * 1.15 + 30

    @rounded_price_top = @total_price_top.round(2)

    added_price_top = (
      (@top_1_cooler[0]&.price || 0) +
      (session[:selected_has_rig] ? (@top_1_rig[0]&.price || 0) : 0)
    )
    
    @rounded_added_price_top = added_price_top.round(2)

    
    @total_price_low = (
      (@top_3_power_supply[0]&.price || 0) + 
      (@top_3_motherboard[0]&.price || 0) + 
      (@top_3_ram[0]&.price || 0) + 
      (@top_3_ssd[0]&.price || 0) + 
      (@top_3_hdd[0]&.price || 0) + 
      (@top_3_graphic_card[0]&.price || 0) + 
      (@top_3_processor[0]&.price || 0)
    ) * 1.15 + 30
    
    @rounded_price_low = @total_price_low.round(2)
    
    @added_price = (
      @top_1_cooler[0]&.price || 0 + 
      @top_1_rig[0]&.price || 0
    )
    
    @rounded_added_price = @added_price.round(2)

    added_price_low = (
      (@top_3_cooler[0]&.price || 0) +
      (session[:selected_has_rig] ? (@top_3_rig[0]&.price || 0) : 0)
    )
    @rounded_added_price_low = added_price_low.round(2)
  end
end
