# Cypress image

This docker image inherits from the standard [Cypress.io](https://github.com/cypress-io) and uses the technique for [Running cypress/included image as non-root mapped](https://github.com/cypress-io/cypress-docker-images/tree/master/examples/included-as-non-root-mapped) to run tests as user 1000.

This allows the test results to be owned by the same user as the Github runner.
