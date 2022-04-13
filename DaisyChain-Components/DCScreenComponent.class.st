Class {
	#name : #DCScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'DaisyChain-Components'
}

{ #category : #'as yet unclassified' }
DCScreenComponent >> blog [
"Return the current blog. In the future we will ask the
session to return the blog of the currently logged in user."
^ DCInv current

]

{ #category : #initialization }
DCScreenComponent >> children [ 
	^ { header }
]

{ #category : #initialization }
DCScreenComponent >> createHeaderComponent [
	^ DCHeaderComponent new
]

{ #category : #initialization }
DCScreenComponent >> initialize [ 
	super initialize.
	header := self createHeaderComponent
]

{ #category : #rendering }
DCScreenComponent >> readSelectedPosts [
^ self currentCategory
ifNil: [ self blog allVisibleBlogPosts ]
ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self
currentCategory ]

]

{ #category : #rendering }
DCScreenComponent >> renderContentOn: html [
super renderContentOn: html.
html tbsContainer: [
html tbsRow showGrid;
with: [
html tbsColumn
extraSmallSize: 12;
smallSize: 2;
mediumSize: 4;
with: [
html render: (DCCategoriesComponent
categories: (self blog allCategories)
postsList: self) ].
html tbsColumn
extraSmallSize: 12;
smallSize: 10;
mediumSize: 8;
with: [
self readSelectedPosts do: [ :p |
html render: (DCPlantComponent new post: p) ] ] ] ]

]
