require 'test_helper'

class ContentControllerTest < ActionController::TestCase

  test "should create a new page content" do
    post :create, params:{url:'http://ruby.bastardsbook.com/chapters/html-parsing/'}
    assert_response 200
  end

  test "should show all urls" do
    get :list_all
    assert_response 200
  end

  test "should get content of url" do
    ContentPage.create(id:1, url: 'foo', content:"This is a test content")
    get :get_content, params:{id: 1}
    assert_response 200
  end

  test "shouldn't get content of url" do
    get :get_content, params:{id: 2}
    assert_response 400
  end

  # test "shouldn't create a new page content if exists" do
  #   post :create, params:{url:'http://ruby.bastardsbook.com/chapters/html-parsing/'}
  #   assert_response 400
  # end
end
