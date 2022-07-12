# Lab 6 - Continuous delivery: Adding a smoke test
## Adding a smoke test to verify the deployment

> Note: this lab builds upon the results of the previous labs

The goal of this lab is to show you how you could add a simple smoke test to your pipeline to make sure the application is still working after a deployment

For our case, the check is super simple, we will verify that the application loads and the user can see the home page.

> Note: If you choose to simulate a deployment in the previous step of the pipeline, you need to also simulate the smoke test.

Contents of the smoke test script:

Lets add a new job to our pipeline that runs this script:

```
jobs:
    [....]
    verify-deployment:
      name: Verify deployment
      needs: check-performance
      runs-on: ubuntu-latest
      if: github.ref == 'refs/heads/main'

      steps:
          - name: Checkout code
            uses: actions/checkout@v2
          - name: Deploy with Node.js ${{ env.NODE_VERSION }}
            uses: actions/setup-node@v1
            with:
                node-version: ${{ env.NODE_VERSION }}
          - name: Run smoke test
            run: |
              npm run test:smoke -- https://google.es
```
## Pipeline Concepts
- ***if***: is a conditional used in this pipeline to control when the "verify-deployment" job can run. It will only run if the commit is pushed to the main branch.

## Useful Theory
[what are smoke tests?](https://circleci.com/blog/smoke-tests-in-cicd-pipelines/)
Smoke tests are designed to reveal these types of failures early by running test cases that cover the critical components and functionality of the application. They also ensure that the application will function as expected in a deployed scenario.
## Lab checklist

- [x] Read the instructions
- [ ] Add the tebuildst job to the CD workflow
- [ ] Push the changes and check the pipeline logs in the Actions tab
- [ ] Think about other tasks that could be automated as part of the build stage in the pipeline
