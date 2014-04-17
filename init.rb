Redmine::Plugin.register :redmine_timetables do
  name 'Redmine Timetables plugin'
  author 'Mikael Borg'
  description 'Timetables for Redmine'
  version '0.0.1'
  url 'http://github.com/nmb-se/redmine_timetables'
  author_url 'http://bils.se/about'
  permission :timetables, { :timetables => [:show] }, :public => true
  menu :project_menu, :timetables, { :controller => 'timetables', :action => 'show' }, :caption => 'Timetable', :after => :activity, :param => :project_id
  menu :admin_menu, :timetable, { :controller => 'timetables', :action => 'show' }, :caption => 'Timetable'
end
