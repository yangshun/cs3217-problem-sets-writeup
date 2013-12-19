
/**
 * Module dependencies.
 */

var express = require('express');
var routes = require('./routes');
var http = require('http');
var path = require('path');
var ejs = require('ejs');
var fs = require('fs');

var app = express();

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'public'));
app.engine('html', require('ejs').renderFile);
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

app.get('/', function(req, res) {
  res.render('index.html');
});

app.get('/edit', function(req, res) {
  res.render('ps/index.html');
});

app.post('/save', function(req, res) {

  var filepath = path.join(__dirname, 'public/ps/PS' + req.body.ps + '/PS' + req.body.ps + '.md');
  fs.writeFile(filepath, req.body.file_data, function (err) {
    if (err) throw err;
    console.log('It\'s saved!');
    res.write('success');
    res.end();
  });
})

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
