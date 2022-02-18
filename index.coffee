###
Render the script tag that renders json-ld
###

# Import formatters
import makeArticleData from './formatters/article.coffee'
import makeOrganizationData from './formatters/organization.coffee'
import makeProductData from './formatters/product.coffee'
import makeSearchData from './formatters/search.coffee'

# Export helper methods
export makeJsonLdArticleTag = (props) -> makeTag makeArticleData props
export makeJsonLdOrganizationTag = (props) -> makeTag makeOrganizationData props
export makeJsonLdProductTag = (props) -> makeTag makeProductData props
export makeJsonLdSearchTag = (props) -> makeTag makeSearchData props

# Wrap the json ld data in the stucture needed by vue meta
makeTag = (data) ->
	type: 'application/ld+json'
	json: { '@context': 'http://schema.org', ...data }
	hid: 'json-ld-' + data['@type'].toLowerCase()
