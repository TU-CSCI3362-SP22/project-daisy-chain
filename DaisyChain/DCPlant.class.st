Class {
	#name : #DCPlant,
	#superclass : #Object,
	#instVars : [
		'name',
		'nickname',
		'description',
		'water',
		'soil',
		'health',
		'visible',
		'category',
		'notes',
		'waterTime'
	],
	#category : #DaisyChain
}

{ #category : #accessor }
DCPlant class >> name: aName description: aDescription [
 ^ self new
		name: aName;
		description: aDescription;
		yourself
]

{ #category : #accessor }
DCPlant class >> name: aName description: aDescription category: aCategory [ 
 ^ self new
		name: aName;
		description: aDescription;
		category: aCategory;
		yourself
]

{ #category : #accessor }
DCPlant class >> unclassifiedTag [
^ 'Unclassified'
]

{ #category : #action }
DCPlant >> beVisibile [
	self visible: true
]

{ #category : #accessing }
DCPlant >> beVisible [
self visible: true
]

{ #category : #accessing }
DCPlant >> category [
	^ category
]

{ #category : #accessing }
DCPlant >> category: anObject [
	category := anObject
]

{ #category : #accessing }
DCPlant >> description [
	^ description
]

{ #category : #accessing }
DCPlant >> description: anObject [
	description := anObject
]

{ #category : #accessing }
DCPlant >> health [
	^ health
]

{ #category : #accessing }
DCPlant >> health: anObject [
	health := anObject
]

{ #category : #initialization }
DCPlant >> initialize [
super initialize.
self category: self class unclassifiedTag.
self visible: true.
self nickname: ''.
self notes: ''.
self waterTime: DateAndTime new.
]

{ #category : #testing }
DCPlant >> isUnclassified [
	^ self category = self class unclassifiedTag
]

{ #category : #testing }
DCPlant >> isVisible [ 
	^ self visible
]

{ #category : #accessing }
DCPlant >> name [
	^ name
]

{ #category : #accessing }
DCPlant >> name: anObject [
	name := anObject
]

{ #category : #testing }
DCPlant >> needsWatering [
	^(((DateAndTime now) - (self waterTime)) asSeconds > 100) ifTrue: [ 'water' ] ifFalse: [ 'no water' ]
]

{ #category : #accessing }
DCPlant >> nickname [
	^ nickname
]

{ #category : #accessing }
DCPlant >> nickname: anObject [
	nickname := anObject
]

{ #category : #action }
DCPlant >> notVisibile [
	self visible: false
]

{ #category : #accessing }
DCPlant >> notVisible [
self visible: false
]

{ #category : #accessing }
DCPlant >> notes [
	^ notes
]

{ #category : #accessing }
DCPlant >> notes: anObject [
	notes := anObject
]

{ #category : #accessing }
DCPlant >> soil [
	^ soil
]

{ #category : #accessing }
DCPlant >> soil: anObject [
	soil := anObject
]

{ #category : #accessing }
DCPlant >> visible [
^ visible

]

{ #category : #accessing }
DCPlant >> visible: aBoolean [
visible := aBoolean

]

{ #category : #accessing }
DCPlant >> water [
	^ water
]

{ #category : #accessing }
DCPlant >> water: anObject [
	water := anObject
]

{ #category : #accessing }
DCPlant >> waterTime [
	^ waterTime
]

{ #category : #accessing }
DCPlant >> waterTime: anObject [
	waterTime := anObject
]
