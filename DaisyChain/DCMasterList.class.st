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
self add: ((DCPlant name:'Orange Tree' description:'A lovely orange tree ready to bear fruit.' category: 'Tree') visible: true).
self add: ((DCPlant name:'Lemon Tree' description:'A lemon tree.' category: 'Tree') visible: true).
self add: ((DCPlant name:'Croton' description:'Not a caesar salad.' category: 'Tree') visible: true).
self add: ((DCPlant name:'Anthurium' description:'Not an aquarium.' category: 'Tree') visible: true).
self add: ((DCPlant name:'Lucky Bamboo' description:'Not unlucky.' category: 'General') visible: true).
self add: ((DCPlant name:'Snake Plant' description:'No step on snek.' category: 'General') visible: true).
self add: ((DCPlant name:'Rose' description:'No touchy.' category: 'Flower') visible: true).
self add: ((DCPlant name:'Carrot' description:'A treat for a rabbit.' category: 'Root') visible: true).
self add: ((DCPlant name:'Potato' description:'Yum.' category: 'Root') visible: true).
self add: ((DCPlant name:'Brussels Sprouts' description:'A treat for a rabbit.' category: 'Cabbage') visible: true).
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
		Transcript show: '| ', plant name, '-', plant category.
		Transcript cr ].
	Transcript show: '----End Master List of Plants.----'.
	Transcript cr.
]
