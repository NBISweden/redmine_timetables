# encoding: utf-8
#
# Redmine - project management software
# Copyright (C) 2006-2014  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

module TimetableHelper
  def users_status_options_for_select(selected)
    user_count_by_status = User.group('status').count.to_hash
    options_for_select([[l(:label_all), ''],
                        ["#{l(:status_active)} (#{user_count_by_status[1].to_i})", '1'],
                        ["#{l(:status_registered)} (#{user_count_by_status[2].to_i})", '2'],
                        ["#{l(:status_locked)} (#{user_count_by_status[3].to_i})", '3']], selected.to_s)
  end

  def issues_for_user(id, proj = nil)
    iarr = Issue.visible.
      where(:assigned_to_id => id).
      includes(:status, :project, :tracker).
      order("#{Issue.table_name}.updated_on DESC").
      all
    if(proj)
      return iarr.find_all{|i| i.project == proj || proj.descendants.include?(i.project)}
    else
      return iarr
    end
  end

  def ttusers
    @project ? @project.users : @users
  end
      
end
