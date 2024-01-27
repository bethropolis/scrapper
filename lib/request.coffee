# lib/request.coffee
import axios from 'axios'

export fetchData =  (url) ->
  try
    response = axios.get(url)
    return response.data

  catch error
    throw new Error "Failed to fetch data from #{url}: #{error.message}"
