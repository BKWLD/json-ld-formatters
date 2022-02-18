# Create a sitelinks search box JSON LD tag
# https://developers.google.com/search/docs/advanced/structured-data/sitelinks-searchbox
export default ({
	siteName
	siteUrl
	urlTemplate
	urlTemplatePlaceholder
} = {}) ->

	# Set defaults and cast vars
	siteName = siteName || process.env.SITE_NAME
	siteUrl = siteUrl || process.env.URL
	urlTemplate = urlTemplate || '/search?q={query}'
	urlTemplatePlaceholder = urlTemplatePlaceholder || 'query'

	# Make the JSON LD
	{
		'@type': 'Website'
		name: siteName
		url: siteUrl
		potentialAction:
			'@type': 'SearchAction'
			name: siteName + ' Search'
			target:
				'@type': 'EntryPoint'
				urlTemplate: siteUrl + urlTemplate
			'query-input': "required name=#{urlTemplatePlaceholder}"

	}
