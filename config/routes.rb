	Rails.application.routes.draw do
		resources :emergencies,  except: [:show, :update]
		resources :responders

		get '/emergencies/:code' => 'emergencies#show'
		patch '/emergencies/:code' => 'emergencies#update'

		patch '/responders/:name  ' => 'responders#update'
		get '/responders/:name  ' => 'responders#show'
		
	end
