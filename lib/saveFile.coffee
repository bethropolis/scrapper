# lib/saveFile.coffee
import fs from 'fs'

export saveToFile = (data, fileName) ->
  try
    fs.writeFileSync(fileName, JSON.stringify(data, null, 2))
    console.log "Data saved to" + fileName

  catch error
    console.error "Failed to save data to" + fileName+ ":" + error.message
