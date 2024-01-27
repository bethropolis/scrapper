# lib/scrapper.coffee
import { fetchData } from './request.js'
import { extractData } from './htmlextractor.js'
import { saveToFile } from './saveFile.js'
import { log } from './log.js'

# Your main scraping function
export scrape =  (config) ->
  try
    log "Starting scraping... #{config.job.length} tasks to run."
    for task in config.job
      if task.type == "list"
        # Handle list scraping
        data =  fetchData task.url 
        extractedData = extractData data, task.selector

      else if task.type == "loop"
        # Handle nested scraping within a loop
        for item in eval task.use
          nestedData = fetchData item[task.url]
          nestedExtractedData = extractData nestedData, task.each.selector

    log("Scraping completed successfully.")

  catch error
    log "Error: #{error.message}"
    # Handle errors gracefully, log, and potentially save the state for debugging
