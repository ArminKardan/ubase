#!/bin/bash

if [[ ! -d "/apps/main" ]] || [[ "$rebuild" == "true" ]]; then
    # echo "Cloning github token:${githubtoken}"

    apk add --no-cache ${packages}

    git clone ${giturl} /apps/main

    cp -r /apps/linux/node /apps/main/node_modules

    sleep 1

    cd /apps/main

    sleep 1

    echo 'Building'

    yarn build

    sleep 1
fi

cd /apps/main

yarn start

echo 'Nextjs crashed :-('

node -e "setInterval(()=>{},1000)"
