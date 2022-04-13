Class {
	#name : #DCInv,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#category : #DaisyChain
}

{ #category : #'as yet unclassified' }
DCInv class >> createDemoPosts [
"TBBlog createDemoPosts"
self current
writeBlogPost: ((DCPlant title: 'Welcome in TinyBlog' text:
'TinyBlog is a small blog engine made with Pharo.' category:
'TinyBlog') visible: true);
writeBlogPost: ((DCPlant title: 'Report Pharo Sprint' text:
'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a
nice event with more than 15 motivated sprinters. With the help
of candies, cakes and chocolate, huge work has been done'
category: 'Pharo') visible: true);
writeBlogPost: ((DCPlant title: 'Brick on top of Bloc -
Preview' text: 'We are happy to announce the first preview
version of Brick, a new widget set created from scratch on top
of Bloc. Brick is being developed primarily by Alex Syrel
(together with Alain Plantec, Andrei Chis and myself), and the
work is sponsored by ESUG.
Brick is part of the Glamorous Toolkit effort and will provide
the basis for the new versions of the development tools.'
category: 'Pharo') visible: true);
writeBlogPost: ((DCPlant title: 'The sad story of unclassified
blog posts' text: 'So sad that I can read this.') visible: true);
writeBlogPost: ((DCPlant title: 'Working with Pharo on the
Raspberry Pi' text: 'Hardware is getting cheaper and many new
small devices like the famous Raspberry Pi provide new
computation power that was one once only available on regular
desktop computers.' category: 'Pharo') visible: true)
]

{ #category : #initialization }
DCInv class >> current [
	^ self selectAll 
		ifNotEmpty: [ :x | x anyOne ]
		ifEmpty: [ self new save ]
]

{ #category : #initialization }
DCInv class >> initialize [ 
	self reset
]

{ #category : #testing }
DCInv class >> initializeVoyageOnMemoryDB [
	VOMemoryRepository new enableSingleton 
]

{ #category : #testing }
DCInv class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents in L databases"
	^ true
]

{ #category : #initialization }
DCInv class >> reset [
	self initializeVoyageOnMemoryDB 
]

{ #category : #'as yet unclassified' }
DCInv >> allBlogPosts [
	^ posts
]

{ #category : #'as yet unclassified' }
DCInv >> allBlogPostsFromCategory: aCategory [
	^ posts select: [ :p | p category = aCategory ]
]

{ #category : #private }
DCInv >> allCategories [
	^ (self allBlogPosts collect: [ :p | p category ]) asSet
]

{ #category : #accessors }
DCInv >> allVisibleBlogPosts [
	^ posts select: [ :p | p isVisible ]
]

{ #category : #'as yet unclassified' }
DCInv >> allVisibleBlogPostsFromCategory: aCategory [ 
	^ posts select: [ :p | p category = aCategory and: [ p isVisible ] ]
]

{ #category : #initialization }
DCInv >> initialize [ 
	super initialize.
	posts := OrderedCollection new
]

{ #category : #removing }
DCInv >> removeAllPosts [
	posts := OrderedCollection new.
	self save.
]

{ #category : #accessing }
DCInv >> size [
	^ posts size
]

{ #category : #writing }
DCInv >> writeBlogPost: aPost [ 
	"Add the blog post to the list of posts"
	self allBlogPosts add: aPost.
	self save
]
