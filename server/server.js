/*jshint esversion:6 */

const express = require('express');
const bcrypt =  require('bcrypt');
const app = express();
const bodyParser = require('body-parser');
const request = require('request');
const methodOverride = require('method-override');
const PORT = process.env.PORT || 8080
;
const stripe = require("stripe")(process.env.STRIPESECRET_KEY);
const passport = require('passport');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const RedisStore = require('connect-redis')(
  session);
const LocalStrategy = require('passport-local').Strategy;
const db = require('./models');
const { Users, coordinates, buoydata, sharkdata, payments } = db;
const userRoute = require('./routes/users');
const buoyRoute = require('./routes/buoy');
const Mailgun = require('mailgun-js');

app.use(express.static("public"));

app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());

app.use(express.static("public"));

app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());

app.use(express.static('public'));
app.use(cookieParser());

app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());

app.use(function(req, res, next){
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Controll-Allow-Header", "Origin, X-Requested-With, Content-Type, Accept");
  res.header("Access-Controll-Allow-Methods", "GET, POST, PUT, DELETE");
  next();
});

app.use(session({
  store: new RedisStore(),
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUnintialized: true
}));

app.use(session({
  secret: process.env.SESSION_SECRET
}));

app.use(passport.initialize());
app.use(passport.session());

app.use('/api/users', userRoute)
app.use('/api/buoy', buoyRoute)


passport.use(new LocalStrategy(
  function(email, password, done){
    Users.findOne({
      where: {
        email : email
      }
    })
    .then(user =>{
      if(user === null){
        return done(null, false, {message: 'bad info'})
      } else {
        bcrypt.compare(password, user.password).then(res => {
          if(res){
            return done(null, user, {message: 'good login'});
          } else {
            return done(null, false, {message: 'bad info'});
          }
        })
      }
    })
    .catch(err =>{
      res.send(err);
    })
  }
));

passport.serializeUser(function(user, done) {
  return done(null, user);
});

app.post('/api/charge/:shark_name/:shark_id', (req, res) => {
  let name = req.params.shark_name;
  let sharkid = req.params.shark_id;
  stripe.customers.create({
    email: req.body.email,
    source: req.body.id
  })
  .then(customer => {
    stripe.charges.create({
      amount: 500,
      currency: 'usd',
      customer: customer.id
    })
    return customer
  })
  .then(customer => {
    let chargeData = customer.sources.data[0];
    payments.create({
      customerid: customer.id,
      email: req.body.email,
      amount: 500,
      lastFourDigits: chargeData.last4,
      cardType: chargeData.brand,
      origin: chargeData.country
    })
    return customer
  })
  .then(customer => {
    sharkdata.update({
      name: name
    },
      {
        where: { shark_id: sharkid }
      }
    )
    .then( _=> {
      res.send('success')
    })
    .catch(err =>{
      res.send(err);
    })
  })
  .catch(err =>{
    res.send(err);
  })
});

app.post('/api/charge', (req, res) => {
  stripe.customers.create({
    email: req.body.email,
    source: req.body.id
  })
  .then(customer => {
    stripe.charges.create({
      amount: 500,
      currency: 'usd',
      customer: customer.id
    })
    return customer
  })
  .then(customer => {
    let chargeData = customer.sources.data[0];
    payments.create({
      customerid: customer.id,
      email: req.body.email,
      amount: 500,
      lastFourDigits: chargeData.last4,
      cardType: chargeData.brand,
      origin: chargeData.country
    })
    .then( _=> {
      res.send('success')
    })
    .catch(err =>{
      res.send(err);
    })
  })
  .catch(err =>{
    res.send(err);
  })
});

passport.deserializeUser(function(user, done) {
  Users.findOne({
    where: {
      email: user.email
    }
  })
  .then(user =>{
    return done(null, user);
  })
  .catch(err =>{
    res.send(err);
  })
});

app.get('/api/allsharks', (req, res) => {
  sharkdata.findAll({
    attributes: ['shark_id', 'name', 'species', 'weight', 'gender', 'tagDate', 'latitude', 'longitude']
  })
  .then((arr) => {
    res.send(arr);
  })
  .catch(err =>{
    res.send(err)
  })
});

app.get('/api/shark/:shark_id', (req, res) => {
  sharkdata.findOne({
    where: {
      shark_id: req.params.shark_id
    },
    attributes: ['shark_id', 'name', 'gender', 'species', 'length', 'weight', 'datetime']
  })
  .then((sharkdata) => {
    res.send(sharkdata);
  })
  .catch(err =>{
    res.send(err);
  })
});

app.get('/api/allbuoys', (req, res )=> {
  Promise.all([
    coordinates.findAll({
      attributes: ['buoyid', 'lat', 'long']
    }),
    buoydata.findOne({
      attributes: ['buoyid', 'wvht']
    })
  ])
  .then((arr) => {
    res.send(arr);
  })
  .catch(err =>{
    res.send(err);
  })
});

app.get('/api/contactus', (req, res) => {
  var mailgun = new Mailgun({apikey : api_key, domain: domain});

  var data = {
    from: from_who,
    to: req.params.mail,
    subject: 'Hello from Mailgun',
    html: 'Hello, This is not a plain-text email, I wanted to test some spicy Mailgun sauce in NodeJS! <a href="http://0.0.0.0:3030/validate?' + req.params.mail + '">Click here to add your email address to a mailing list</a>'
  };

  mailgun.message().send(data, function (err, body) {
    if(err){
      res.render('error', {error: err});
      console.log('ERORR dude', err);
    } else {
      res.render('submited', {email: req.params.mail});
    }
  });

});

app.listen(PORT, function(){
  console.log('server started on', PORT);
  db.sequelize.sync();
});

module.exports = app;
