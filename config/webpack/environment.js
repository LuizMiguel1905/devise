const { environment } = require('@rails/webpacker')

environment.entry.set('application', './app/javascript/application.js');



module.exports = environment
