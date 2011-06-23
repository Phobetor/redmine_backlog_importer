class BacklogImporterController < ApplicationController
  unloadable


  def index
    @project = Project.find(params[:id])
    @id = params[:id]

    @projects = Project.find(:all)
    @trackers = @projects.map(&:trackers).inject{|memo,t| memo & t}
  end

  def import
    @project = Project.find(params[:id])
    @errors = Array.new
    if nil == params || '' == params
      redirect_to :action => 'index', :id => params[:id]
    else
      data = params[:import]

      if nil == data || '' == data
        redirect_to :action => 'index', :id => params[:id]
      else
        tracker = Tracker.find(data[:tracker_id])

        serializedIssues = data[:issues]

        if nil == serializedIssues || '' == serializedIssues
          redirect_to :action => 'index', :id => params[:id]
        else
          serializedIssueRows = serializedIssues.split("\n")
          serializedIssueRows.each do |serializedIssueRow|
            issueData = serializedIssueRow.split("\t")
            issueParams = {
              "author" => User.current,
              "project" => @project,
              "tracker" => tracker,
              "subject" => sprintf("%s: %s", issueData[0], issueData[1]),
              "description" => sprintf("Als »%s« möchte ich »%s« damit »%s«.", issueData[2], issueData[3], issueData[4]),
              "story_points" => issueData[5].to_i
            }
            issue = Issue.new(issueParams)
            if !issue.save
              @errors[] = issue.errors
            end
          end
          redirect_to :action => 'index', :id => params[:id]
        end
      end
    end
  end
end
