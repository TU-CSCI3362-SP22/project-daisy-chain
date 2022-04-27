"
^ (self allPlants collect: [ :p | p category ]) asSet
"
Class {
	#name : #DCInv,
	#superclass : #Object,
	#instVars : [
		'plants',
		'masterListOfPlants',
		'wishlist'
	],
	#category : #DaisyChain
}

{ #category : #'as yet unclassified' }
DCInv class >> createDemoPlants [
"DCInvcreateDemoPlants"
self current
writeBlogPost: ((DCPlant name: 'Orange Tree' description:
'A lovely orange tree ready to bear fruit.' category: 'Tree') visible: true);
writeBlogPost: ((DCPlant name: 'Tomato Plant' description:
'A wilting tomato plant that could use some care.' category: 'Vine') visible: true);
writeBlogPost: ((DCPlant name: 'Carrots' description:
'A patch of carrots that were just planted.' category: 'Roots') visible: true);
writeBlogPost: ((DCPlant name: 'Unknown Plant' description:
'Unsure what this is but Ill let it grow.') visible: true);
writeBlogPost: ((DCPlant name: 'Lemon Tree' description:
'A lemon tree.' category: 'Tree') visible: true);
writeWishlistPlant: ((DCPlant name: 'GEM Tree' description:
'A GEM tree.' category: 'Tree') visible: true)
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

{ #category : #private }
DCInv >> allCategories [
	^ (self allPlants collect: [ :p | p category ]) asSet

]

{ #category : #'as yet unclassified' }
DCInv >> allPlants [
	^ plants
]

{ #category : #'as yet unclassified' }
DCInv >> allPlantsFromCategory: aCategory [
	^ plants select: [ :p | p category = aCategory ]
]

{ #category : #accessors }
DCInv >> allVisiblePlants [
	^ plants select: [ :p | p isVisible ]
]

{ #category : #'as yet unclassified' }
DCInv >> allVisiblePlantsFromCategory: aCategory [ 
	^ plants select: [ :p | p category = aCategory and: [ p isVisible ] ]
]

{ #category : #'as yet unclassified' }
DCInv >> allWishlistPlants [
	^ wishlist
]

{ #category : #initialization }
DCInv >> initialize [ 
	super initialize.
	masterListOfPlants := DCMasterList new.
	plants := OrderedCollection new.
  wishlist := OrderedCollection new.
	
]

{ #category : #accessing }
DCInv >> masterListOfPlants [
	^ masterListOfPlants
	
"Warning! this returns the DCMasterList Object! Not the master list OrderedCollection.
Call [masterListOfPlants masterlist] to get the actual OrderedCollection"
]

{ #category : #accessing }
DCInv >> masterListOfPlants: anObject [
	masterListOfPlants := anObject
]

{ #category : #'as yet unclassified' }
DCInv >> plantsNotOwned [
|  allOwnedPlants notHaveList |
	allOwnedPlants := self allPlants.
	notHaveList := OrderedCollection new.
	masterListOfPlants masterlist do: [ :plant | (allOwnedPlants includes: plant) ifFalse: [notHaveList add: plant]].
	^ notHaveList
]

{ #category : #removing }
DCInv >> remove: aPlant [
	DCInv current wishlist: (DCInv current wishlist reject: [ :p | p == aPlant ])
]

{ #category : #removing }
DCInv >> removeAllPlants [
	plants := OrderedCollection new.
	self save.
]

{ #category : #accessing }
DCInv >> size [
	^ plants size
]

{ #category : #accessing }
DCInv >> wishlist [
	^ wishlist
]

{ #category : #accessing }
DCInv >> wishlist: anObject [
	wishlist := anObject
]

{ #category : #writing }
DCInv >> writeBlogPost: aPost [ 
	"Add the blog post to the list of posts"
	self allPlants add: aPost.
	self save
]

{ #category : #writing }
DCInv >> writeWishlistPlant: aPost [ 
	"Add the blog post to the list of posts"
	self allWishlistPlants add: aPost.
	self save
]
