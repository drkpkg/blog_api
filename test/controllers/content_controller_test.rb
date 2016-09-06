require 'test_helper'

class ContentControllerTest < ActionController::TestCase

  def setup
    @content_page = ContentPage.create(url: 'foo', content:"")
  end

  test "should show all urls" do
    get :list_all
    assert_response 200
  end

  test "should get content of url" do
    get :get_content, params:{url: 'foo'}
    assert_response 200
  end

  test "shouldn't get content of url" do
    get :get_content, params:{url: 'bar'}
    assert_response 400
  end

  test "should create a new page content" do
    post :create, params:{url:'http://ruby.bastardsbook.com/chapters/html-parsing/'}
    assert_response 200
  end

  # test "shouldn't create a new page content if exists" do
  #   post :create, params:{url:'http://ruby.bastardsbook.com/chapters/html-parsing/'}
  #   assert_response 400
  # end
end
