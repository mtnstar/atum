# Atum

## setup development environment

get sources

```
git clone https://github.com/psunix/atum.git
cd atum
```

### backend

install rvm https://rvm.io

```
rvm install 2.2.4
rvm use 2.2.4
```

install dependencies

```
bundle install
```

setup database

```
rails db:setup
```

start backend server
```
rails s
```

### frontend

install nvm https://github.com/creationix/nvm

```
nvm install v0.12.13
nvm use v.0.12.13
```
change to frontend dir
```
cd frontend
```

install dependencies

```
npm install
bower install
```

start frontend application server
```
ember s --proxy http://localhost:3000
```

access application at http://localhost:4200
