Rails.application.routes.draw do
  scope '/kubespray' do
    constraints(:id => %r{[^\/]+}) do
      resources :hostgroups, :only => [] do
        member do
          get :play_kubespray
        end
      end
    end
  end
end
