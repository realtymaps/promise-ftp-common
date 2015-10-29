### jshint node:true ###
### jshint -W097 ###
'use strict'


class FtpConnectionError extends Error
  constructor: (message) ->
    if @ not instanceof FtpConnectionError
      throw new TypeError("FtpConnectionError constructor called without 'new' keyword")
    
    @name = 'FtpConnectionError'
    @message = message
    Error.captureStackTrace(this, FtpConnectionError)

    
module.exports = FtpConnectionError
