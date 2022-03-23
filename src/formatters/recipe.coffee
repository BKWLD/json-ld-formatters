# Create Recipe JSON LD data
# https://developers.google.com/search/docs/advanced/structured-data/recipe

export default ({
	title
	image
	publishedAt
	updatedAt
	author
	description
	prepTime
	cookTime
	recipeCategory
	recipeCuisine
	recipeYield
	recipeIngredient
	recipeInstructions
} = {}) ->

	# Make the JSON LD
	{
		'@type': "Recipe"
		name: title
		image
		author
		datePublished: publishedAt?.toISOString?()
		dateModified: updatedAt?.toISOString?()
		prepTime
		cookTime
		recipeCategory
		recipeCuisine
		recipeYield
		recipeIngredient
		recipeInstructions: makeInstructions recipeInstructions
	}

makeInstructions = (instructions) -> 
	return unless instructions?.length
	instructions.map (instruction) -> {...instruction, "@type": "HowToStep"}