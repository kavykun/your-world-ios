# Your World iOS App

You need to have apollo-codegen install since it will run a bash script on every build.

1. First install brew.

```
https://brew.sh/
```

2. Use brew to install nvm (node package installer).

```
brew update
brew install nvm
mkdir ~/.nvm
vim ~/.bash_profile
```

3. Add nvm to bash profile.

```
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
```

4. Use nvm to install node.

```
nvm install 10
nvm alias default node
```

5. Run the Xcode build.

apollo-codegen introspect-schema http://localhost:4000 --output schema.json
