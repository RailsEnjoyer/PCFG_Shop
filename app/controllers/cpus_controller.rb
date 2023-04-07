class CpusController < ApplicationController
  def index
    @cpus = Cpu.all
  end

  def show
    @cpu = Cpu.find(params[:id])
  end

  def new
    @cpu = Cpu.new
  end

  def create
    @cpu = Cpu.new(cpu_params)
    if @cpu.save
      redirect_to cpu_path(@cpu), notice: 'CPU was successfully created.'
    else
      render :new
    end
  end

  def edit
    @cpu = Cpu.find(params[:id])
  end

  def update
    @cpu = Cpu.find(params[:id])
    if @cpu.update(cpu_params)
      redirect_to @cpu
    else
      render 'edit'
    end
  end

  def destroy
    @cpu = Cpu.find(params[:id])
    @cpu.destroy
    redirect_to cpus_path
  end

  private

  def cpu_params
    params.require(:cpu).permit(:brand, :model, :price, :socket, :core_count, :thread_count, :base_clock, :boost_clock, :tdp, :compatible_socket, :cache, :image, :rating)
  end
end
