# Create a JSON LD organization tag, mainly for logo
# https://developers.google.com/search/docs/advanced/structured-data/logo
export default ({
	name
	url
	logo
	publishedAt
	updatedAt
} = {}) ->

	# Set defaults and cast vars
	name = name || process.env.SITE_NAME
	url = url || process.env.URL

	# Make the JSON LD
	{
		'@type': 'Organization'
		name
		url
		logo
	}
