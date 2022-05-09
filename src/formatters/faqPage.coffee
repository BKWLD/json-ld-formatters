# Create FAQ Page JSON LD data
# https://developers.google.com/search/docs/advanced/structured-data/faqpage
export default ({
	title
	questions
} = {}) ->

	# Make the JSON LD
	{
		'@type': 'FAQPage'
		mainEntity: questions.map (question) ->
			"@type": "Question"
			name: question.question
			acceptedAnswer:
				"@type": "Answer"
				text: question.answer
	}
