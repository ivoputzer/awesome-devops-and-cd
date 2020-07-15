const { createServer } = require('http')
const { createReadStream } = require('fs')

createServer(requestListener)
  .listen(process.env.HTTP_PORT)

function requestListener (request, response) {
  const fileName = request.url.slice(1)

  createReadStream(fileName)
    .pipe(response)
}
