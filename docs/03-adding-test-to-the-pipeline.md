# Lab 3: Continuous integration - Testing the app

## Adding a testing stage to our continuous integration process

The goal of this lab is to create the first stage in our CD pipeline, the test step.

First, lets tell GH Actions to execute the NPM commands inside the application folder:

```yml
defaults:
  run:
    working-directory: modern-web-app
```

The next step is to specify the test job and add it to the pipeline definition:

```yml
jobs:
  test:
    name: Test
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Setup Node.js ${{ env.NODE_VERSION }}
        uses: actions/setup-node@v1
        with:
          node-version: ${{ env.NODE_VERSION }}
      - name: Run unit tests
        run: |
          npm ci
          npm run test:unit
```

## Lab checklist

- [x] Read the instructions
- [ ] Add the test job to the CD workflow
- [ ] Push the changes and check in the Actions tab
- [ ] Break the tests and push the changes
