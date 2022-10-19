# Create a JSON LD organization tag, mainly for logo
# https://developers.google.com/search/docs/advanced/structured-data/logo
export default ({
	name
	logo
	url
	otherUrls = [] # List of alternate URLS, like twitter, etc
	phone
	address
	city
	state
	zip
} = {}) ->

	# Set defaults and cast vars
	name = name || process.env.SITE_NAME
	url = url || process.env.URL

	# Make the JSON LD
	{
		'@type': 'Organization'
		name
		logo
		url
		...(unless otherUrls.length then {} else sameAs: otherUrls)
		...(unless phone then {} else contactPoint: [
			'@type': 'ContactPoint'
			telephone: phone
			contactType: 'sales'
		])
		...(unless address and city and state and zip then {} else location:
			'@type': 'Place'
			address:
				'@type': 'PostalAddress'
				streetAddress: address
				addressLocality: city
				addressRegion: state
				postalCode: zip
		)
	}
