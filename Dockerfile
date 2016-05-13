FROM ubuntu:trusty
MAINTAINER "Pedro Cesar" <pedrocesar.ti@gmail.com>
EXPOSE 6379

# VARIABLES
ENV DIRECTORY "/home/hubot"
ENV NAME "cyberdyne"
ENV OWNER "Pedro Cesar"
ENV DESCRIPTION "Hubot teste."

# INSTALL SYSTEM TOOLS
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	autoconf \
	build-essential \
	ca-certificates \
	curl \
	git-core

RUN git clone git://github.com/OiNutter/nodenv.git /root/.nodenv && \
	git clone git://github.com/OiNutter/node-build.git /root/.nodenv/plugins/node-build

ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:/root/.nodenv/shims:/root/.nodenv/bin:$PATH

RUN nodenv install 0.11.9 && \
	nodenv global 0.11.9 && \
	nodenv rehash

RUN sudo npm install -g yo@1.5.0 generator-hubot

# USER MANAGEMENT FOR APP
RUN useradd -d "$DIRECTORY" -ms /bin/bash hubot
RUN echo "hubot	ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
WORKDIR "$DIRECTORY"

# INSTALL APP
USER hubot
RUN yo hubot --owner="$OWNER" --name="$NAME" --description="DESCRIPTION" --defaults
RUN npm install hubot-scripts
RUN npm install hubot-slack

# STARTING APP AND SERVICES
ADD conf/ "$DIRECTORY"
RUN echo "sudo /usr/bin/redis-server /etc/redis/redis.conf ; /home/hubot/bin/hubot --adapter slack > /home/hubot/hubot.log 2>&1 &" > "$DIRECTORY"/init_app.sh
RUN chmod +x "$DIRECTORY"/init_app.sh 

# START EVERYTHING AND WATCHING LOGS
CMD bash /home/hubot/init_app.sh && tail -f /home/hubot/hubot.log
