# Description

The idea of project is to allow owners of open source repositories on github accept pull requests into their projects.

User adds his repo to site, creates issues for his repo on github, labels them as “RubyNoob” and, optionally, adds label with complexity description, and this issue will be parsed by application and added to database.
Any visitor that sees it in the list of issues will be able to contribute his code to fix the issue helping to make the project better as a result

# Todo

~~User can register via Github (github-omniauth)~~

~~User can add his open source repositories (octokit)~~

~~All added repositories are pinged once in 3 minutes (sidekiq, crono)~~

~~If open issue with label “RubyNoob” is found in the repo, those issues are parsed and added into app database~~

~~If issue with “RubyNoob” label have either “Beginner”, “Intermediate” or “Proficient” label, it is added to issue record in app as a complexity level~~

~~If issue state changed to ‘closed’, it is archived~~
