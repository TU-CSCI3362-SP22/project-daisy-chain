Class {
	#name : #DCInvTest,
	#superclass : #TestCase,
	#instVars : [
		'inv',
		'plant'
	],
	#category : #'DaisyChain-Tests'
}

{ #category : #running }
DCInvTest >> setUp [
	inv := DCInv new.
	plant := DCPlant 
			name: 'Orange Tree' 
			description: '[DCInvTest] A lovely orange tree ready to bear fruit.' 
			category: 'Tree'.
			
	"Hooks that subclasses may override to define the fixture of test."

]

{ #category : #tests }
DCInvTest >> testAllCategories [
	inv writeBlogPost: plant.
	self assert: inv allCategories size equals: 1
]

{ #category : #tests }
DCInvTest >> testAllPlantsFromCategory [
| trees |
	inv allPlants add: ((DCPlant name: 'Orange Tree' description: '[testAllPlantsFromCategory] an ornage tree for testing, you should not see this.' category: 'Tree') visible: true).
	inv allPlants add: ((DCPlant name: 'rose' description: '[testAllPlantsFromCategory] a rose for testing, you should not see this.' category: 'Flower') visible: true).
	trees := inv allPlantsFromCategory: 'Tree'.
	trees do: [ :tree | self assert: tree category equals: 'Tree'. ].
]

{ #category : #tests }
DCInvTest >> testAllVisiblePlants [
	|visibleplants|
	visibleplants := inv allVisiblePlants.
	visibleplants do: [ :visibleplant| self assert: visibleplant isVisible ]
]

{ #category : #tests }
DCInvTest >> testAllVisiblePlantsFromCategory [
	|visibleplantsfromcategory|
	inv allPlants add: ((DCPlant name: 'Orange Tree' description: '[testAllVisiblePlantsFromCategory] an ornage tree for testing, you should not see this.' category: 'Tree') visible: true).
	inv allPlants add: ((DCPlant name: 'rose' description: '[testAllVisiblePlantsFromCategory] a rose for testing, you should not see this.' category: 'Flower') visible: true).
	visibleplantsfromcategory := inv allVisiblePlantsFromCategory:'Tree'.
	visibleplantsfromcategory do: [ :visibleplant| self assert: visibleplant isVisible. self assert: visibleplant category equals: 'Tree']
]

{ #category : #tests }
DCInvTest >> testPlantsNotOwned [
	|plantsNoHave plantsHave|
	plantsNoHave := inv plantsNotOwned.
	plantsHave := inv allPlants.
	plantsNoHave do: [ :plantNoHave| self assert: (plantsHave includes: plantNoHave) equals:false ]
]

{ #category : #tests }
DCInvTest >> testRemoveAllPlants [
	inv allPlants add: ((DCPlant name: 'Orange Tree' description: '[testRemoveAllPlants] an ornage tree for testing, you should not see this.' category: 'Tree') visible: true).
	self assert: inv allPlants size equals: 1.
	inv removeAllPlants.
	self assert: inv allPlants size equals: 0
]

{ #category : #tests }
DCInvTest >> testWishlistPlant [
	|newplant|
	newplant = ((DCPlant name: 'Orange Tree' description: '[testWishlistPlant] an ornage tree for testing, you should not see this.' category: 'Tree') visible: true).
	inv writeWishlistPlant: newplant.
	self assert: (inv allPlants includes: newplant) equals: false.
	self assert: (inv allWishlistPlants includes: newplant)
]

{ #category : #tests }
DCInvTest >> testWriteBlogPost [
	|newplant|
	newplant = ((DCPlant name: 'Orange Tree' description: '[testWriteBlogPost] an ornage tree for testing, you should not see this.' category: 'Tree') visible: true).
	inv writeBlogPost: newplant.
	self assert: (inv allPlants includes: newplant).
]
