# Create Product JSON LD data
# https://developers.google.com/search/docs/advanced/structured-data/product
export default ({
	name
	image
	description
	sku
	brand
	url
	price
	available
	productID
	priceValidUntil
	gtin12
} = {}) ->
	# Set defaults and cast vars
	brand = brand || process.env.SITE_NAME

	# Make the JSON LD
	{
		'@type': 'Product'
		"@id": url
		name
		image
		description: do -> description
			?.replace /<\/?[^>]+(>|$)/g, '' # Remove html
			.replace /\s+/g, ' ' # Remove newlines and double spaces
			.trim()
		sku
		productID
		gtin12
		brand:
			'@type': 'Brand'
			name: brand
		offers: {
			'@type': 'Offer'
			url
			priceCurrency: 'USD'
			price
			priceValidUntil
			availability: do ->
				return unless available?
				if available
				then 'https://schema.org/InStock'
				else 'https://schema.org/OutOfStock'
		}
	}