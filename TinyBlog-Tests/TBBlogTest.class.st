Class {
	#name : #TBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first',
		'previousRepository'
	],
	#category : #'TinyBlog-Tests'
}

{ #category : #'as yet unclassified' }
TBBlogTest class >> createDemoPlants [
"TBBlog createDemoPosts"
self current
writeBlogPost: ((TBPost title: 'Welcome in TinyBlog' text:
'TinyBlog is a small blog engine made with Pharo.' category:
'TinyBlog') visible: true);
writeBlogPost: ((TBPost title: 'Report Pharo Sprint' text:
'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a
nice event with more than 15 motivated sprinters. With the help
of candies, cakes and chocolate, huge work has been done'
category: 'Pharo') visible: true);
writeBlogPost: ((TBPost title: 'Brick on top of Bloc -
Preview' text: 'We are happy to announce the first preview
version of Brick, a new widget set created from scratch on top
of Bloc. Brick is being developed primarily by Alex Syrel
(together with Alain Plantec, Andrei Chis and myself), and the
work is sponsored by ESUG.
Brick is part of the Glamorous Toolkit effort and will provide
the basis for the new versions of the development tools.'
category: 'Pharo') visible: true);
writeBlogPost: ((TBPost title: 'The sad story of unclassified
blog posts' text: 'So sad that I can read this.') visible: true);
writeBlogPost: ((TBPost title: 'Working with Pharo on the
Raspberry Pi' text: 'Hardware is getting cheaper and many new
small devices like the famous Raspberry Pi provide new
computation power that was one once only available on regular
desktop computers.' category: 'Pharo') visible: true)
]

{ #category : #testing }
TBBlogTest class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents in noSQL databases"
	^ true
]

{ #category : #initialization }
TBBlogTest >> setUp [
previousRepository := VORepository current.
VORepository setRepository: VOMemoryRepository new.
blog := TBBlog current.
first := TBPost title: 'A title' text: 'A text' category: 'First
Category'.
blog writeBlogPost: first.
post := (TBPost title: 'Another title' text: 'Another text'
category: 'Second Category') beVisible

]

{ #category : #initialization }
TBBlogTest >> tearDown [ 
	VORepository setRepository: previousRepository 
]

{ #category : #initialization }
TBBlogTest >> testAddBlogPost [
	blog writeBlogPost: post.
	self assert: blog size equals: 2
	
]

{ #category : #tests }
TBBlogTest >> testAllBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allPlants size equals: 2
]

{ #category : #tests }
TBBlogTest >> testAllBlogPostsFromCategory [
	self assert: (blog allPlantsFromCategory: 'First Category') size equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllCategories [
	blog writeBlogPost: post.
	self assert: blog allCategories size equals: 2
]

{ #category : #tests }
TBBlogTest >> testAllVisibleBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allVisiblePlants size equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllVisibleBlogPostsFromCategory [
	blog writeBlogPost: post.
	self assert: (blog allVisiblePlantsromCategory: 'First Category') size equals: 0.
	self assert: (blog allVisiblePlantsromCategory: 'Second Category') size equals: 1
]

{ #category : #tests }
TBBlogTest >> testRemoveAllBlogPosts [
	blog removeAllPlants.
	self assert: blog size equals: 0
]

{ #category : #tests }
TBBlogTest >> testSize [
	self assert: blog size equals: 1

]

{ #category : #tests }
TBBlogTest >> testUnclassifiedBlogPosts [
	self assert: (blog allPlants select: [ :p | p isUnclassified ]) size equals: 0
]
