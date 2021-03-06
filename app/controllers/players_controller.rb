class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction, :get_stats
  
  def index
    @players = Player.order(params[:sort] + " " + params[:direction])
  end
  
  # GET /players
  # GET /players.json
  def index
    @players = Player.order(params[:sort])
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render action: 'show', status: :created, location: @player }
      else
        format.html { render action: 'new' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :position, :fg, :ft, :tpm, :reb, :ast, :stl, :blk, :pts, :fgs)
    end

    def sort_column
   		 Player.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
  
    def sort_direction
         %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
    
    def get_stats
        fg_array = []
        ft_array = []
        tpm_array = []
        reb_array = []
        ast_array = []
        stl_array = []
        blk_array = []
        pts_array = []

        Player.each do |player|
          fg_array.push(player.fg)
          ft_array.push(player.ft)
          tpm_array.push(player.tpm)
          reb_array.push(player.reb)
          ast_array.push(player.ast)
          stl_array.push(player.stl)
          blk_array.push(player.blk)
          pts_array.push(player.pts)
        end
   ##     stats = []
   #     stats.push(DescriptiveStatistics::Stats.new(fg_array))
   #     stats.push(DescriptiveStatistics::Stats.new(ft_array))
   #     stats.push(DescriptiveStatistics::Stats.new(tpm_array))
   #     stats.push(DescriptiveStatistics::Stats.new(reb_array))
   #     stats.push(DescriptiveStatistics::Stats.new(ast_array))
   #     stats.push(DescriptiveStatistics::Stats.new(stl_array))
   #     stats.push(DescriptiveStatistics::Stats.new(blk_array))
   #     stats.push(DescriptiveStatistics::Stats.new(pts_array))

   #     @stats = stats
    end
end
