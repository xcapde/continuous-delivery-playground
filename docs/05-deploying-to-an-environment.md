# Lab 5: Continuous delivery - Deploying the app

## Deploying the app to production

> Note: this lab builds upon the results of the previous labs

The goal of this lab is to show you how you could automate the deployment of the app to a specific environment, e.g. staging or production.

In previous stages of the pipeline we make sure the latest changes were integrated, the test were passing and the application could be built. That gives us enough confident that we can deploy the latest version of the app, thus the latest changes into an environment.

> Think about this: Where do the latest changes are delivering value? Is it when they are tested and the application is built or is it when they are deployed and released to the end users?

This stage of the pipeline is a bit more complicated. Think about it: We are not running code only in the Github Actions machines, we need to authenticate with the service where we will deploy our app. In this case we use Vercel. You can think of Vercel like a free server where you can expose your app to real users.

If you don't have a vercel account, it is fine! No worries. You can go for option 1 in our deployment menu: Simulating a deployment.

## Option 1: Let's simulate a deployment

Lets add a new job that allow us to deploy our modern web app to an environment that we will call production.

In order to do so, we will just simply run a command that simulates a deployment and tells when the deployment is completed.

Lets add a new job:

```
jobs:
    [....]
    deploy-prod:
        name: Deploy to prod
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
            - name: Deploy to prod environment
              run: |
               npm run deploy:simulate -- production
```

## Option 2: Let's perform a real deployment

Lets add a new job that allow us to deploy our modern web app to an environment that we will call production.

```
jobs:
    [....]
    deploy-prod:
        name: Deploy to prod
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
            - name: Deploy to prod environment
              run: |
                npm i -g vercel
                vercel --token "$VERCEL_TOKEN" --prod
              env:
                VERCEL_ORG_ID: ${{ secrets.VERCEL_ORG_ID }}
                VERCEL_PROJECT_ID: ${{ secrets.VERCEL_PROJECT_ID }}
                VERCEL_TOKEN: ${{ secrets.VERCEL_TOKEN }}
```

## Lab checklist

- [x] Read the instructions
- [ ] Add the tebuildst job to the CD workflow
- [ ] Push the changes and check the pipeline logs in the Actions tab
- [ ] Think about other tasks that could be automated as part of the build stage in the pipeline
