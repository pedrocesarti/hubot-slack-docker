# hubot-slack-docker
Container running GitHub Hubot with a plugin to connect to a Slack team. Some environment variables have to be set to permit connection with a Slack account in a specific channel.

 This repository is connect to DockerHub to create an image automaticaly. So you just need run a docker container where the source is **pedrocesarti/hubot**.

## Running container
To run this container, you should running the command above:

```shell
docker run --name mybot -it  -e HUBOT_SLACK_TOKEN='####################' -e Hubot_SLACK_TEAM='######################' -e Hubot_SLACK_BOTNAME='############' -d pedrocesarti/hubot-slack
```

## Environment Variable
The variables set on runnning is used to connect on Slack account, Slack channel and to set a name for your bot. You can read more about integrations with Slack and generate the token to connect [here](https://slack.com/apps/A0F7XDU93-hubot).

| Variable  | Function |
|---------|--------|
| **HUBOT_SLACK_TOKEN** | Token generate for Slack integration. | 
| **Hubot_SLACK_TEAM** | Account for connection team. | 
| **Hubot_SLACK_BOTNAME** | Name for user used for Hubot to connect to account. | 

Some Hubot scripts used to use Google API to make searches on Internet, however Google disable that resource and couple scripts broke. So now you have to create a SEARCH ENGINE and connect that to you own GOOGLE API. You can read more about theses issues at the end of this file, but in general you only need put those variables on container environment and everything is going to work. 

| Variable  | Function |
|---------|--------|
| **HUBOT_GOOGLE_CSE_ID** | Id to connect a Google accountToken generate for Slack integration. | 
| **HUBOT_GOOGLE_CSE_KEY** | Account for connection team. | 



