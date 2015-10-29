### jshint node:true ###
### jshint -W097 ###
'use strict'


class FtpReconnectError extends Error
  constructor: (disconnectError='', connectError='', onCwd) ->
    if @ not instanceof FtpReconnectError
      throw new TypeError("FtpReconnectError constructor called without 'new' keyword")
      
    @name = 'FtpReconnectError'
    @disconnectError = disconnectError
    @connectError = connectError
    
    # build custom stack
    prefix = "Error automatically reconnecting to server"
    suffix = "Triggering disconnect error"
    if onCwd
      mainMsg = "Could not preserve CWD"
    else
      mainMsg = "Could not connect to server"
    @message = "#{prefix}.  #{mainMsg}: #{@connectError}.  #{suffix}: #{@disconnectError}."
    connectErrorStack = "#{@connectError.stack||@connectError}"
    if connectErrorStack[-1..-1] != '\n'
      connectErrorStack += '\n'
    disconnectErrorStack = "#{@disconnectError.stack||@disconnectError}"
    if disconnectErrorStack[-1..-1] != '\n'
      disconnectErrorStack += '\n'
    @stack = "#{@name}: #{prefix}.\n#{mainMsg}: #{connectErrorStack}#{suffix}: #{disconnectErrorStack}"
  
  # the following are to set the prototype appropriately
  disconnectError: null
  connectError: null


module.exports = FtpReconnectError
