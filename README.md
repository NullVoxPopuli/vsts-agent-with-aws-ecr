# vsts-agent-with-aws-ecr
Dockerized vsts-agent with AWS' EC2 Container Registry


```
docker run \
  --name vsts_agent1 \
  -d \
  -e VSTS_URL=https://mycompany.visualstudio.com \
  -e VSTS_PAT_TOKEN=asdfasdfgobbledygook2512341234 \
  -e VSTS_AGENT_NAME=agent1 developertown/vsts-agent:2.102.0 \
  -e VSTS_POOL=MyAgentPool \
  -e AWS_ACCESS_KEY_ID=1234 \
  -e AWS_SECRET_ACCESS_KEY=123456
```
