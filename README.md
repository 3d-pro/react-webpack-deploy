React Webpack Docker Deployment
===================
----------
Prerequisite
-------------

 - docker-engine >1.9 (Installation script: `wget -qO- http://get.docker.com | sh`
 - docker-compose >1.5 (Installation: `pip install docker-compose`

How to deploy
-------------

 - Clone deploy script from IT KMITL GitLab 

```
git clone git@git.it.kmitl.ac.th:kittipun/react-webpack-deploy.git
```

 - Clone react-webpack-node code into this folder:

```
git clone https://github.com/choonkending/react-webpack-node.git
```

 - Edit DB Config in `react-webpack-node/server/config/secrets.js` and changed to this:

```
export const db = process.env.MONGOHQ_URL || process.env.MONGOLAB_URI || 'mongodb://mongodb/ReactWebpackNode';
```

 - Run MongoDB container using this command:
 
```
cd react-webpack-deploy
docker-compose -f compose-database.yml up -d
```

 - Build React image using this command:
```
cd react-webpack-deploy
./build-image.sh
```

 - After building is completed, run this command to start React:
```
docker-compose -f compose-app.yml up -d
```

 - The website should be access by going to `http://localhost:3000`

 - You can now start working on the site. If you want to redeploy, just run build image and redeploy by using docker-compose

Troubleshooting
-------------

 - Delete all container
```
docker-compose -f compose-app.yml down
docker-compose -f compose-database.yml down
```

