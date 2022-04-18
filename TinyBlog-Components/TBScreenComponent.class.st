Class {
	#name : #TBScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'as yet unclassified' }
TBScreenComponent >> blog [
"Return the current blog. In the future we will ask the
session to return the blog of the currently logged in user."
^ TBBlog current

]

{ #category : #initialization }
TBScreenComponent >> children [ 
	^ { header }
]

{ #category : #initialization }
TBScreenComponent >> createHeaderComponent [
	^ TBHeaderComponent new
]

{ #category : #initialization }
TBScreenComponent >> initialize [ 
	super initialize.
	header := self createHeaderComponent
]

{ #category : #rendering }
TBScreenComponent >> readSelectedPlants [
^ self currentCategory
ifNil: [ self blog allVisiblePlants ]
ifNotNil: [ self blog allVisiblePlantsromCategory: self
currentCategory ]

]

{ #category : #rendering }
TBScreenComponent >> renderContentOn: html [
super renderContentOn: html.
html tbsContainer: [
html tbsRow showGrid;
with: [
html tbsColumn
extraSmallSize: 12;
smallSize: 2;
mediumSize: 4;
with: [
html render: (TBCategoriesComponent
categories: (self blog allCategories)
postsList: self) ].
html tbsColumn
extraSmallSize: 12;
smallSize: 10;
mediumSize: 8;
with: [
self readSelectedPlants do: [ :p |
html render: (TBPostComponent new post: p) ] ] ] ]

]
