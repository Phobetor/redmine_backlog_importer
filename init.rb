require 'redmine'

Redmine::Plugin.register :redmine_google_docs_backlog_importer do
  name 'Redmine Google Docs Backlog Importer'
  author 'Phobetor'
  description 'Plugin to import copied content of a Google Docs table as issues into Redmine.'
  version '0.0.1'
  url 'https://github.com/phobetor/RedmineGoogleDocsBacklogImporter'
  author_url 'https://github.com/phobetor'
  permission :google_docs_backlog_importer, {:google_docs_backlog_importer => [:index, :import]}, :public => true
  menu :project_menu, :rgdb_importer, { :controller => 'google_docs_backlog_importer', :action => 'index' }, :caption => 'ImportIssues'
end
