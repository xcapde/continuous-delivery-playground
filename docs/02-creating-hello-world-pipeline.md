# Lab 2: Creating a hello world pipeline

### GitHub Actions to create a CI/CD pipeline
This tutorial uses github actions to create a hello world pipeline.


The first step is to create a github workflow, to do so, you have to create the following folder structure:
```
   mkdir .github/
   mkdir .github/workflows/
```
Now we creat a workflow inside the workflows folder
```
touch .github/workflows/pipeline.yml
```

copy the following code :
```
name: CI/CD Pipeline

on: push
jobs:
  hello-world:
    runs-on: ubuntu-latest
    steps:
      - name: Hello World step
        run: echo "Hello World!"
```
### 
***Name***: This is just specifying a name for the workflow
***On***: The on command is used to specify an event that will trigger the workflow, this event can be push, pull_request, etc
***Jobs***: Here we are specifying the job we want to run, in this case, we are setting up a build job.
***Runs-on:***  is specifying the OS you want your workflow to run on 
***Steps:*** Steps just indicate the various steps you want to run on that job

Let's test our workflow:
```
git add .
git commit -m "Add workflow file"
git push
```
once you push to the branch, you should see 
## Lab checklist (TBC)

- [x] Read the instructions
- [ ] TBC

## Useful Theory 
[What is a pipeline?](https://www.atlassian.com/devops/devops-tools/devops-pipeline#:~:text=A%20DevOps%20pipeline%20is%20a,code%20to%20a%20production%20environment.)
a pipeline is a system of automated processes designed to quickly and accurately move new code additions and updates from version control to production.

[what is continous integration?](https://martinfowler.com/articles/continuousIntegration.html#:~:text=Continuous%20Integration%20is%20a%20software,to%20multiple%20integrations%20per%20day.)
Continuous Integration is a software development practice where members of a team integrate their work frequently, usually each person integrates at least daily - leading to multiple integrations per day.

[what is continous delivery?](https://aws.amazon.com/devops/continuous-delivery/?nc1=h_ls)
is a software development practice where code changes are automatically prepared for a release to production.
With continuous delivery, every code change is built, tested, and then pushed to a non-production testing or staging environment. 
Continuous delivery automates the entire software release process. 

[what is github actions?](https://resources.github.com/downloads/What-is-GitHub.Actions_.Benefits-and-examples.pdf)
GitHub Actions brings automation directly into the software development lifecycle on GitHub via event-driven triggers. These
triggers are specified events that can range from creating a pull request to building a new brand in a repository.
