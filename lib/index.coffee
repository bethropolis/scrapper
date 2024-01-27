import { scrape } from './scrapper.js'

# Read the JSON configuration
import config from '../test.json' assert { type: 'json' }

console.log "Starting scraping... #{config.job.length} tasks to run."

scrape config
