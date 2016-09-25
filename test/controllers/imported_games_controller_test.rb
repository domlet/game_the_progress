require 'test_helper'

class ImportedGamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get imported_games_index_url
    assert_response :success
  end

end
