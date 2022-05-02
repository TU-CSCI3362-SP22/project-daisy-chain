Class {
	#name : #DCScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header',
		'addPlant'
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
	^ { header . addPlant}
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
DCScreenComponent >> readSelectedPlants [
^ self currentCategory
ifNil: [ self blog allVisiblePlants ]
ifNotNil: [ self blog allVisiblePlantsFromCategory: self
currentCategory ]

]

{ #category : #rendering }
DCScreenComponent >> readWishlistPlants [
^ self blog wishlist


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
html heading level: 2; with:'Your Plants'.
self readSelectedPlants do: [ :p |
html render: (DCPlantComponent new plant: p) ] ].
html tbsColumn 
extraSmallSize: 12;
smallSize: 10;
mediumSize: 8;
with: [
html heading level: 2; with:'Wishlist '.
self readWishlistPlants do: [ :p |
	html render: (DCWishlistComponent new plant: p) ] ]].
html break.
html break.
html heading level: 2; with:'Add Plant'.
html tbsRow showGrid;
	with: [
		html tbsColumn 
		extraSmallSize: 12;
		smallSize: 10;
		mediumSize: 8;
		with: [
			html render: DCAddPlantComponent new.
		
		 ].
		]
].

]
