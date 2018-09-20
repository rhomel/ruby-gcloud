
# A Docker image for Ruby and CircleCI that includes 
# Google Cloud Platform `gcloud` tools.

FROM circleci/ruby:2.4.4-jessie

# Google Cloud tools setup

RUN sudo apt-get update -qqy && sudo apt-get install -qqy \
        python-dev \
        python-setuptools \
        apt-transport-https \
        lsb-release

RUN sudo apt-get install gcc-multilib && \
    sudo easy_install -U pip && \
    sudo pip uninstall crcmod && \
    sudo pip install -U crcmod

RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

RUN sudo apt-get update && sudo apt-get install -y google-cloud-sdk && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true

