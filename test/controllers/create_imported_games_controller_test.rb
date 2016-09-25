require 'test_helper'

class CreateImportedGamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get create_imported_games_index_url
    assert_response :success
  end

end
