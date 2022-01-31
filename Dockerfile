FROM cypress/included:4.12.1

ARG USER_ID=1000
ARG GROUP_ID=1000

# create the needed group
RUN groupadd -g ${GROUP_ID} docker
# do not log creating new user, otherwise there could be a lot of messages
RUN useradd -r --no-log-init -u ${USER_ID} -g docker docker
RUN install -d -m 0755 -o docker -g docker /home/docker

# move test runner binary folder to the non-root's user home directory
RUN mv /root/.cache /home/docker/.cache

USER docker
# show user effective id and group - it should be non-zero
# meaning the current user is not root
RUN id
