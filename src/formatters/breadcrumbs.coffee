# Create a JSON LD breadcrumb tag
# https://developers.google.com/search/docs/advanced/structured-data/breadcrumb

# Set defaults and cast vars
url = url || process?.env?.URL || window?.location?.href

export default ({ breadcrumbsList = [], name = 'Breadcrumbs' }) ->

	# Make the breadcrumbs
	breadcrumbs = breadcrumbsList.map (data, index, array) -> 
		{
			'@type': 'ListItem'
			position: index + 1
			name: data.name
			item: getItem data
		}

	# Make the JSON LD
	{
		"@context": "https://schema.org"
		"@type": "BreadcrumbList",
		name
		"itemListElement": breadcrumbs
	}

# Helper to get breadcrumb item 
getItem = (breadcrumb) -> 
	return unless breadcrumb.url or breadcrumb.path
	if breadcrumb.url then breadcrumb.url else url + breadcrumb.path