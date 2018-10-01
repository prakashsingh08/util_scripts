#!/bin/bash
ms_array=(review browse encryption auth profile payments loyalty lookup recommendations profile product resources kcc  checkout)
env_url=$1
env_url2=$2
echo "Service,env1_Commit_ID,env2_Commit_ID"
for i in ${ms_array[@]}; do
curl -H 'user-agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1' -L ${env_url}/api/${i}/info -s |jq -jr '.build.name,",",.git.commit.id'
curl -H 'user-agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1' -L ${env_url2}/api/${i}/info -s |jq -jr '",",.git.commit.id'
echo "\n"
done
curl -sL -H 'user-agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1'  ${env_url}/info |jq -jr '.build.name,",",.git.commit.id'
curl -sL -H 'user-agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1' ${env_url2}/info |jq -jr '",",.git.commit.id'
echo "\n"
curl -sL -H 'user-agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1' ${env_url}/api/info |jq -jr '.build.name,",",.git.commit.id'
curl -sL -H 'user-agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1' ${env_url2}/api/info |jq -jr '",",.git.commit.id'
echo "\n"

curl -sL -H 'user-agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1' ${env_url}/cbp/healthinfo |jq -jr '.name,",",.revision'
curl -sL -H 'user-agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1' ${env_url2}/cbp/healthinfo |jq -jr '",",.revision'
