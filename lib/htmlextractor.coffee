# htmlextractor.coffee

# Import necessary modules
import cheerio from 'cheerio'

# Function to extract data from HTML using CSS selectors
export extractData = (html, selector) ->
  $ = cheerio.load(html)
  return $(selector).map((_, element) -> $(element).text()).get()

