# Create Article JSON LD data
# https://developers.google.com/search/docs/advanced/structured-data/article
export default ({
	type
	title
	image
	publishedAt
	updatedAt
	author
} = {}) ->

	# Set defaults and cast vars
	type = type || 'blog'

	# Make the JSON LD
	{
		'@type': switch type
			when 'news' then 'NewsArticle'
			when 'article' then 'Article'
			when 'blog' then 'BlogPosting'
			else "Unknown article type #{type}"
		headline: title
		image
		author
		datePublished: publishedAt?.toISOString?()
		dateModified: updatedAt?.toISOString?()
	}
