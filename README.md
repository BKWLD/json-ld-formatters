# json-ld-formatters

A library of helper functions for creating common JSON LD schemas.  These are intended to be used in Nuxt.js projects.

## Example

Here's how you would use this in a typical Cloak page component.

```vue
<!-- pages/_article.vue -->
<script lang='coffee'>
import pageMixin from '@bkwld/cloak/mixins/page'
import { makeJsonLdArticleTag } from '@bkwld/json-ld-formatters'
export default

	# Add Cloak's pageMixin to the example.  This isn't necessary, but I think
	# it useful to show how you would use @buildHead to mash up other meta / SEO
	# data with this
	mixins: [ pageMixin ]

	# Here's where the use the formatter
	head: -> {
		...@buildHead
			title: @page.title
		script: [ makeJsonLdArticleTag
			title: @page.title
			image: @page.image
			publishedAt: new Date @page.dateCreated
			updatedAt: new Date @page.dateUpdated
			author: 'Bukwild'
		]
	}

	# Showing an example of fetching page data
	asyncData: ({ app, route }) ->
		page = await app.$service.getPageData route.params.article
		return { page }

</script>
```

## Formatters

Read the source code for the available formatters and their expected properties.

- [article](./formatters/article.coffee)
- [organization](./formatters/organization.coffee)
- [product](./formatters/product.coffee)
- [search](./formatters/search.coffee)
