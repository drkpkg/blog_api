Rails.application.routes.draw do
  scope 'api' do
    scope 'v1' do
      scope 'url' do
        get 'list_all' => 'content#list_all', as: :list_all
      end
      scope 'content' do
        get '/' => 'content#get_content', as: :get_content
        post 'create' => 'content#create', as: :create
      end
    end
  end
end
