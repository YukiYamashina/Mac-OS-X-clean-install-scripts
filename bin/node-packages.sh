#!/ bin/bash

echo ""
echo ""
echo "install global node packages in /usr/local/bin (executable) and ~/.config/yarn/global/node_modules"
echo ""
echo ""

# node-sass
package_list="@vue/cli
              apidoc
              create-react-app
              detox-cli
              expo-cli
              firebase-tools
              gulp-cli
              json-server
              react-devtools
              verdaccio
              web-push"

for package in ${package_list} ; do
    if [ ! -e ~/.config/yarn/global/node_modules/${package} ]; then
        echo "installing ${package} in /usr/local/bin (executable) and ~/.config/yarn/global/node_modules ..."
        yarn global add ${package}
    else
        echo "${package} is installed in ~/.config/yarn/global/node_modules ..."
    fi
done

echo "finished installing npm packages in global ..."

### To build the binding for the current node version
# npm rebuild node-sass

echo "following packages are installed in global environment:"
yarn global list
