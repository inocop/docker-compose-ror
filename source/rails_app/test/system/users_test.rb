require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "users/sign_in"

    assert_selector "h1", text: "Rails App"
  end
end