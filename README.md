# vsts-agent-with-aws-ecr
Dockerized vsts-agent with AWS' EC2 Container Registry


```
docker run \
  --name my_custom_vsts_agent \
  -it \
  -e VSTS_ACCOUNT=mycompany \
  -e TFS_URL=https://mycompany.visualstudio.com \
  -e VSTS_TOKEN=1234567891011121314151617181920 \
  -e VSTS_AGENT=my-agent-name \
  -e VSTS_POOL=MyPoolName \
  -v /var/run/docker.sock:/var/run/docker.sock \
  nullvoxpopuli/vsts-agent-with-aws-ecr:latest

```
