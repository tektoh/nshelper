crumb :root do
  link 'ホーム', root_path
end

crumb :presentations do
  link 'プレゼンテーション', presentations_path
  parent :root
end

crumb :new_presentation do
  link '新しいプレゼンテーション', new_presentation_path
  parent :presentations
end

crumb :presentation do |presentation|
  link presentation.title, presentation_path(presentation)
  parent :presentations
end

crumb :edit_presentation do |presentation|
  link '編集', edit_presentation_path(presentation)
  parent :presentation, presentation
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
