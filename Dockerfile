ARG CYPRESS_VERSION=4.12.1
FROM cypress/included:${CYPRESS_VERSION}

ARG USER_ID=1000
ARG GROUP_ID=1000

# do not log creating new user, otherwise there could be a lot of messages
RUN useradd -r --no-log-init -u ${USER_ID} -g ${GROUP_ID} docker
RUN install -d -m 0755 -o ${USER_ID} -g ${GROUP_ID} /home/docker

# move test runner binary folder to the non-root's user home directory
RUN mv /root/.cache /home/docker/.cache

USER docker
# show user effective id and group - it should be non-zero
# meaning the current user is not root
RUN id
