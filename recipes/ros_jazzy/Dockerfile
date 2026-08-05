ARG BASE_IMAGE=ros:jazzy

FROM ${BASE_IMAGE}

# workaround interactive prompts during apt installations and transient network errors
ENV DEBIAN_FRONTEND=noninteractive CURL_HOME=/etc

RUN echo 'Acquire::Retries 4;' > /etc/apt/apt.conf.d/80retries && \
    echo 'retry = 4' > /etc/.curlrc && \
    echo 'retry-all-errors' >> /etc/.curlrc && \
    apt-get update && apt-get dist-upgrade --no-install-recommends -y \ 
    ca-certificates curl sudo ros-${ROS_DISTRO}-desktop-full && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/ros_entrypoint.sh"]
