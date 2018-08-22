#!/bin/sh

# configure git
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_NAME

# init hexo if dir is empty
if ! [ "$(ls -A ./ )" ]; then
	hexo init && npm install
fi


# install modules if not
[ -d "node_modules" ] || npm install --from-lockfile

# run hexo as production / developemnt mode
if [[ $1 == "production" ]]; then
	hexo server -s
else
	hexo server
fi
