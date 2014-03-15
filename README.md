clickLabs Bootstrap
===================

To get started you'll you'll need Node and Ruby installed on your machine.

Grunt is a task runner that automates some parts of the devlopment process. To install it change directory to the project root and run.

```
npm install
```

This will install grunt and all of the dependencies needed to work on the project, with one exception. To work on the .scss files we need to install Compass

```
gem update --system
gem install compass
```

Then we can build the project

```
grunt
```

Grunt Tasks
-----------------

`grunt compile` - Compile any SCSS and CoffeeScript

`grunt watch` - Compiles files and then watches for changes. Also starting a live reload server. See #LiveReload

`grunt build` - Generate a production ready build

`grunt compass` - Compile Compass

`grunt coffee` - Compile CoffeeScript

`grunt imagemin` - Optimize all .jpg and .png files in the project







