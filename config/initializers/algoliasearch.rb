if Rails.env.production?
  AlgoliaSearch.configuration = {
    application_id: ENV['ALGOLIASEARCH_API_KEY'],
    api_key: ENV['ALGOLIASEARCH_APPLICATION_ID']
  }
end
