require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { ast: @player.ast, blk: @player.blk, fg: @player.fg, ft: @player.ft, name: @player.name, position: @player.position, pts: @player.pts, reb: @player.reb, stl: @player.stl, tpm: @player.tpm }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    patch :update, id: @player, player: { ast: @player.ast, blk: @player.blk, fg: @player.fg, ft: @player.ft, name: @player.name, position: @player.position, pts: @player.pts, reb: @player.reb, stl: @player.stl, tpm: @player.tpm }
    assert_redirected_to player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to players_path
  end
end
