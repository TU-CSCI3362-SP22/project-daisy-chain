Class {
	#name : #DCMasterList,
	#superclass : #Object,
	#instVars : [
		'masterlist'
	],
	#category : #DaisyChain
}

{ #category : #adding }
DCMasterList >> add: aPlant [
	"if aPlant in masterlist"
	(masterlist includes: aPlant)
	ifFalse: [masterlist add: aPlant]
	ifTrue: [Transcript show: '[DCMasterList/add]: The plant "', aPlant name asString, '" already exists in the master list.'.
				Transcript cr].
]

{ #category : #initialization }
DCMasterList >> fillMasterList [

"Flower"
self add: ((DCPlant name:'Rose' description:'No touchy.' category: 'Flower') visible: true).
self add: ((DCPlant name:'Lily' description:'So many types.' category: 'Flower') visible: true).

"Fruit"
self add: ((DCPlant name:'Blueberry' description:'small blue.' category: 'Fruit') visible: true).
self add: ((DCPlant name:'Strawberry' description:'spicy.' category: 'Fruit') visible: true).
self add: ((DCPlant name:'Grape' description:'not good for dogs.' category: 'Fruit') visible: true).

"General"
self add: ((DCPlant name:'Lucky Bamboo' description:'Not unlucky.' category: 'General') visible: true).
self add: ((DCPlant name:'Snake Plant' description:'No step on snek.' category: 'General') visible: true).

"Tree"
self add: ((DCPlant name:'Apple tree' description:'Gravity.' category: 'Fruit') visible: true).
self add: ((DCPlant name:'Orange Tree' description:'A lovely orange tree ready to bear fruit.' category: 'Tree') visible: true).
self add: ((DCPlant name:'Lemon Tree' description:'A lemon tree.' category: 'Tree') visible: true).
self add: ((DCPlant name:'Croton' description:'Not a caesar salad.' category: 'Tree') visible: true).
self add: ((DCPlant name:'Anthurium' description:'Not an aquarium.' category: 'Tree') visible: true).

"Vegetable"
self add: ((DCPlant name:'Carrot' description:'A treat for a rabbit.' category: 'Vegetable') visible: true).
self add: ((DCPlant name:'Potato' description:'Yum.' category: 'Vegetable') visible: true).
self add: ((DCPlant name:'Brussels Sprout' description:'A treat for a rabbit.' category: 'Vegetable') visible: true).
]

{ #category : #initialization }
DCMasterList >> initialize [
	masterlist := OrderedCollection new.
	self fillMasterList.
]

{ #category : #accessing }
DCMasterList >> masterlist [
	^ masterlist
]

{ #category : #accessing }
DCMasterList >> masterlist: anObject [
	masterlist := anObject
]

{ #category : #printing }
DCMasterList >> printCurrentList [
	Transcript show: '------Master List of Plants:------'.
	Transcript cr.
	masterlist do:  [ :plant | 
		Transcript show: '| ', plant category, '-', plant name.
		Transcript cr ].
	Transcript show: '----End Master List of Plants.----'.
	Transcript cr.
]
