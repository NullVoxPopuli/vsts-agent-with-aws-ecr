# vsts-agent-with-aws-ecr
Dockerized vsts-agent with AWS' EC2 Container Registry


```bash
docker run \
  -it \
  -e AWS_ACCESS_KEY_ID=AKo8e7oeufcer \
  -e AWS_SECRET_ACCESS_KEY=AWSCOEUoeuaoeuUROROEU777 \
  -e AWS_DEFAULT_REGION=us-east-1 \
  -e VSTS_ACCOUNT=mycompany \
  -e TFS_URL=https://mycompany.visualstudio.com \
  -e VSTS_TOKEN=1234567891011121314151617181920 \
  -e VSTS_AGENT=my-agent-name \
  -e VSTS_POOL=MyPoolName \
  -e VSTS_WORK='/var/vsts/$VSTS_AGENT' \
  -v /var/vsts/:/var/vsts \
  -v /var/run/docker.sock:/var/run/docker.sock \
  nullvoxpopuli/vsts-agent-with-aws-ecr:latest

```
