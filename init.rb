require 'redmine'

Redmine::Plugin.register :redmine_backlog_importer do
  name 'Redmine Backlog Importer'
  author 'Phobetor'
  description 'Plugin to import tab delimited backlogs (e. g. copied content of a Google Docs spreadsheet) into Redmine.'
  version '0.0.1'
  url 'https://github.com/phobetor/RedmineBacklogImporter'
  author_url 'https://github.com/phobetor'
  permission :backlog_importer, {:backlog_importer => [:index, :import]}, :public => true
  menu :project_menu, :rgdb_importer, { :controller => 'backlog_importer', :action => 'index' }, :caption => 'ImportIssues'
end
