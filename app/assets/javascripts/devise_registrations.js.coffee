Registration = Paloma.controller('Devise/Registrations')

Registration.prototype.new = ->
  console.log('attempt to fetch username and show feedback'+
    'so people know if a username is available as they are signing up')