
# check-list  #

An Express + CoffeeScript + Mustache application for creating
check-lists. Useful for creating QA checklists for manual
processes.

## Requirements ##

In order to use check-list, you'll need the following:

 * Node JS – [Node installation instructions][node]
 * Node Package Manager – [npm installation instructions][npm]
 * CoffeeScript installed globally – 
   run `npm install -g coffee-script`


## Usage ##

run `npm install -d`.

Now you can run your application with `coffee app.coffee`.

## Development ##

If you need to make changes to the front end javascript please run
`coffee -o public/script/ --join main.js -cw app/scripts/`
to compile the main.js file

## Further Documentation ##

You can find further documentation on the libraries used in this
template below:

 * CoffeeScript, the beautiful language this template is written 
   in – [docs][coffee]
 * Express, High performance, high class web development for 
   Node.js – [docs][express]
 * (Hulk) Hogan, the library and connector for express – 
   [Hogan.js][hogan], 
   [express connector docs][hulk]


## License ##

Dual licensed under the [MIT][mit] or [GPL Version 2][gpl]
licenses.


[node]: http://nodejs.org/
[npm]: http://npmjs.org/
[dl]: https://github.com/rowanmanning/express-coffee-template/zipball/master
[coffee]: http://jashkenas.github.com/coffee-script/
[express]: http://expressjs.com/
[hulk]: https://github.com/quangv/hulk-hogan
[hogan]: http://twitter.github.com/hogan.js/
[mit]: http://opensource.org/licenses/mit-license.php
[gpl]: http://opensource.org/licenses/gpl-2.0.php
