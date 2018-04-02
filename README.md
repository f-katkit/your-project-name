### start project
```
git clone git@github.com:f-katkit/hugo-on-arukas.git ./${new-project-name}
cd ${new-project-name}
```

### push as your project
Create your repository on github beforehand.

```
rm -rf .git
git init
git remote add origin git@github.com:${username}/${new-project-name}.git
git push -u origin master
```

### build a docker image
```
docker build -t ${image_name} .
```

### run develop server on localhost

```
docker run -it --rm --volume $(pwd)/post:/go/src/site/content/post --name ${name} -p 80:80 ${image_name}
```

### create new post
```
docker run -it --rm --volume $(pwd)/post:/go/src/site/content/post ${image_name} new ${new-page-name}
```
