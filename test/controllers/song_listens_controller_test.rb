require 'test_helper'

class SongListensControllerTest < ActionController::TestCase
  setup do
    @song_listen = song_listens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:song_listens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song_listen" do
    assert_difference('SongListen.count') do
      post :create, song_listen: {  }
    end

    assert_redirected_to song_listen_path(assigns(:song_listen))
  end

  test "should show song_listen" do
    get :show, id: @song_listen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song_listen
    assert_response :success
  end

  test "should update song_listen" do
    patch :update, id: @song_listen, song_listen: {  }
    assert_redirected_to song_listen_path(assigns(:song_listen))
  end

  test "should destroy song_listen" do
    assert_difference('SongListen.count', -1) do
      delete :destroy, id: @song_listen
    end

    assert_redirected_to song_listens_path
  end
end
