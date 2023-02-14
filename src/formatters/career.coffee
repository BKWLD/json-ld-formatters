# Create JobPosting JSON LD data
# https://developers.google.com/search/docs/appearance/structured-data/job-posting
export default ({
	title
	description
	organization: {
		name: organizationName
		url: organizationUrl
		logo: organizationLogo
	} = {}
	location: {
		address
		city
		state
		zip
	} = {}
	locationRequirements: {
    countrySpec: countrySpecUrl
    countryName: countryName
	} = {}
	type = 'FULL_TIME'
	publishedAt
} = {}) ->

	# Is there a location
	hasLoc = address and city and state and zip

	# Make the JSON LD
	{
		'@type': 'JobPosting'
		title
		description
		employmentType: type
		datePosted: publishedAt?.toISOString?()
		hiringOrganization:
			'@type': 'Organization'
			name: organizationName || process.env.SITE_NAME
			sameAs: organizationUrl || process.env.URL
			logo: organizationLogo
		...(unless hasLoc then {jobLocationType: 'TELECOMMUTE'} else jobLocation:
			'@type': 'Place'
			address:
				'@type': 'PostalAddress'
				streetAddress: address
				addressLocality: city
				addressRegion: state
				postalCode: zip
		)
		applicantLocationRequirements:
			'@type': 'Country'
			sameAs: countrySpecUrl || 'https://www.wikidata.org/wiki/Q30'
			name: countryName || 'USA'
	}
