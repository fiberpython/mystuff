const express = require('express')
const app = express()

app.use(express.static('public'))

app.get('/', (req, res) => {
 res.sendFile(process.cwd() + '/index.html')
})

app.listen(3000, () => {
 console.log('Listening on port ' + 3000)
})

/ npm install --save express
