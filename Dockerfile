FROM ubuntu:trusty
MAINTAINER "Pedro Cesar" <pedrocesar.ti@gmail.com>
EXPOSE 6379

# VARIABLES
ENV DIRECTORY "/home/hubot"
ENV NAME "cyberdyne"
ENV OWNER "Pedro Cesar"
ENV DESCRIPTION "Hubot teste."

# INSTALL SYSTEM TOOLS
RUN apt-get update
RUN apt-get install -y nodejs npm redis-server
RUN apt-get install nodejs-legacy
RUN sudo npm install -g yo generator-hubot

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

