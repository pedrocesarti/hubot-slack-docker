# hubot-slack-docker
Container running GitHub Hubot with a connector to Slack chat. Some environment variables have to be set to permit connection with a Slack account in a specific channel. This repository is connect to DockerHub to create an image automaticaly.

## Running container
To run this container, you should running the command above:

```shell
docker run --name mybot -it -e HUBOT_GOOGLE_CSE_ID='################' -e HUBOT_GOOGLE_CSE_KEY='#############' -e HUBOT_SLACK_TOKEN='####################' -e Hubot_SLACK_TEAM='######################' -e Hubot_SLACK_BOTNAME='############' -d pedrocesarti/hubot-slack
```

## Environment Variable
The variables set on runnning is used to connect on Slack account, Slack channel and Google Search API. Some Hubot scripts 

| Variable  | Function |
|---------|:--------:|
| HUBOT_SLACK_TOKEN | Token generate for Slack integration. | 
| Hubot_SLACK_TEAM | Account for connection team. | 
| Hubot_SLACK_BOTNAME | Name for user used for Hubot to connect to account. | 

Some Hubot scripts

| Variable  | Function |
|---------|:--------:|
| HUBOT_GOOGLE_CSE_ID | Id to connect a Google accountToken generate for Slack integration. | 
| HUBOT_GOOGLE_CSE_KEY | Account for connection team. | 



