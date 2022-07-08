# Lab 4: Continuous integration - Building and packaging the app

## Adding a testing stage to our continuous integration process

> Note: this lab builds upon the results of the previous labs

The goal of this lab is to show you how to build and package the app.

In the previous stage of our pipeline we make sure the latest changes are integrated and the test are passing. We now want to build, package and version the new version of the application.

Lets add a new job call build with the following steps

```
jobs:
    [....]
    build:
        name: Build
        runs-on: ubuntu-latest

        steps:
            - name: Checkout code
              uses: actions/checkout@v2
            - name: Setup Node.js ${{ env.NODE_VERSION }}
              uses: actions/setup-node@v1
              with:
                  node-version: ${{ env.NODE_VERSION }}
            - name: Build the application
              run: |
                npm ci
                npm run build
```

As you can see, we have a step to build the application and its dependecies with NPM.

## Lab checklist

- [x] Read the instructions
- [ ] Add the tebuildst job to the CD workflow
- [ ] Push the changes and check the pipeline logs in the Actions tab
- [ ] Think about other tasks that could be automated as part of the build stage in the pipeline
