# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get '/projects/:project_id/timetable', :to => 'timetables#show', :as => 'project_timetable'
#  get '/issues/timetable', :to => 'timetables#show'
get 'timetable', :to => 'timetables#show'

