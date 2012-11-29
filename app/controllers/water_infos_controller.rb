#encoding: utf-8
class WaterInfosController < ApplicationController
  before_filter :authenticate_user!
  
  def link
    
  end

  def auditor
    if current_user.role == "admin"
      @house1_wi = House.find(1).water_infos.order('mont DESC')
      @house2_wi = House.find(2).water_infos.order('mont DESC')

      search_params = params[:water_info]

      unless search_params.blank?
        date = Date.new(search_params["mont(1i)"].to_i, search_params["mont(2i)"].to_i, 1)
        @house1_wi = @house1_wi.where('mont <= ? and mont >= ?',date.end_of_month, date.beginning_of_month)
        @house1_wi = @house1_wi.where('mont <= ? and mont >= ?',date.end_of_year, date.beginning_of_year)
        @house2_wi = @house2_wi.where('mont <= ? and mont >= ?',date.end_of_month, date.beginning_of_month)
        @house2_wi = @house2_wi.where('mont <= ? and mont >= ?',date.end_of_year, date.beginning_of_year)
      end

    else
      flash[:notice] = t "devise.failure.access_denied"
      redirect_to root_url
    end
  end


  # GET /water_infos
  # GET /water_infos.json
  def index
    @water_infos = WaterInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @water_infos }
    end
  end

  # GET /water_infos/1
  # GET /water_infos/1.json
  def show
    @water_info = WaterInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @water_info }
    end
  end

  # GET /water_infos/new
  # GET /water_infos/new.json
  def new
    @water_info = WaterInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @water_info }
    end
  end

  # GET /water_infos/1/edit
  def edit
    @water_info = WaterInfo.find(params[:id])
  end

  # POST /water_infos
  # POST /water_infos.json
  def create
    @water_info = WaterInfo.new(params[:water_info])
    wc = current_user.water_infos.order('created_at DESC').first.water_wc
    k = current_user.water_infos.order('created_at DESC').first.water_kitchen

    @water_info.user = current_user
    @water_info.mont = Date.today
    if wc.present? and k.present?
      @water_info.kons_w = @water_info.water_wc - wc
      @water_info.kons_k = @water_info.water_kitchen - k
    end
    respond_to do |format|
      if @water_info.save
        format.html { redirect_to root_url, notice: 'Ваши показания счетчиков успешно сохранены.' }
        format.json { render json: @water_info, status: :created, location: @water_info }
      else
        format.html { render action: "new" }
        format.json { render json: @water_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /water_infos/1
  # PUT /water_infos/1.json
  def update
    @water_info = WaterInfo.find(params[:id])

    respond_to do |format|
      if @water_info.update_attributes(params[:water_info])
        format.html { redirect_to @water_info, notice: 'Water info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @water_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /water_infos/1
  # DELETE /water_infos/1.json
  def destroy
    @water_info = WaterInfo.find(params[:id])
    @water_info.destroy

    respond_to do |format|
      format.html { redirect_to water_infos_url }
      format.json { head :no_content }
    end
  end
end
