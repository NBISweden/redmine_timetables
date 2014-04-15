Redmine::Plugin.register :redmine_timetables do
  name 'Redmine Timetables plugin'
  author 'Mikael Borg'
  description 'Timetables for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://bils.se/about'
  menu :admin_menu, :timetable, { :controller => 'timetables', :action => 'show' }, :caption => 'Timetable'
end
