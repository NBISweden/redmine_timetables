require 'redmine'

Redmine::Plugin.register :redmine_timetables do
  name 'Redmine Timetables plugin'
  author 'Mikael Borg'
  description 'Timetables for Redmine: adds views for user schedules.'
  version '0.1'
  url 'http://github.com/nmb-se/redmine_timetables'
  project_module :timetables do
    permission :timetables, { :timetables => [:show] }, :public => true
  end
  menu :project_menu, :timetables, { :controller => 'timetables', :action => 'show' }, :caption => 'Timetable', :after => :activity, :param => :project_id
  menu :admin_menu, :timetable, { :controller => 'timetables', :action => 'show' }, :caption => 'Timetable'
end
