require_relative './runner.rb'

desc 'Update'
task :update do
  DubaiHackathon::update
  commit_docs
end

def commit_docs
  system "git add docs"
  system "git commit -m 'Automated commit'"
end
