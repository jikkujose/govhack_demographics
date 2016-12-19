require_relative './runner.rb'

desc 'Update'
task :update do
  DubaiHackathon::update
  commit_docs
  push_commits
end

def commit_docs
  system "git add docs"
  system "git commit -m 'Automated commit'"
end

def push_commits
  system "git push origin master"
end
