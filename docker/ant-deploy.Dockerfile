FROM debian:buster

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      build-essential python3-dev python3-setuptools python3-wheel python3-pip ssh-client git rsync \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3 1 \
    && rm -rf /var/lib/apt/lists/*

ENV SCRIPT_PATH="/scripts/deploy.sh"
ENV COMMAND="ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook ./ansible/all.yml -i ./ansible/inventory.py -l ant-hl.allocloud.com -e dev=true"
RUN echo "$(dirname "$SCRIPT_PATH")" && \
    mkdir -p "$(dirname "$SCRIPT_PATH")" && \
    echo "#!/bin/bash\npip3 install -r requirements.txt\n$COMMAND" > "$SCRIPT_PATH" && \
    chmod +x "$SCRIPT_PATH" && \
    cat "$SCRIPT_PATH"
