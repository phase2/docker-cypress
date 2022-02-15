ARG CYPRESS_VERSION=4.12.1

# image has Cypress npm module installed globally in /root/.npm/node_modules
# and Cypress binary cached in /root/.cache/Cypress folder
FROM cypress/included:${CYPRESS_VERSION}

# give every user read access to the "/root" folder where the binary is cached
# we really only need to worry about the top folder, fortunately
RUN ls -la /root
# Allow docker group to WRITE so additional cypress plugins can be installed by projects.
RUN chgrp -R 1000 /root/.npm
RUN chgrp -R 1000 /root/.cache
RUN chmod 775 /root
RUN chmod 775 /root/.npm
RUN chmod 775 /root/.cache
RUN chmod 775 /root/.cache/Cypress
# point Cypress at the /root/cache no matter what user account is used
# see https://on.cypress.io/caching
ENV CYPRESS_CACHE_FOLDER=/root/.cache/Cypress

# switch to non-root user "node" that comes from Docker Node image
USER node
# show user effective id and group - it should be non-zero
# meaning the current user "node" is not root
RUN id
# user "node" should be able to access the Cypress test runner now
RUN ls -la /root/.cache/Cypress/*/Cypress
