Class {
	#name : #DCPlant,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #DaisyChain
}

{ #category : #accessor }
DCPlant class >> title: aTitle text: aText [
 ^ self new
		title: aTitle;
		text: aText;
		yourself
]

{ #category : #accessor }
DCPlant class >> title: aTitle text: aText category: aCategory [
	^ (self title: aTitle text: aText)
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
DCPlant >> date [
^ date

]

{ #category : #accessing }
DCPlant >> date: aDate [
date := aDate

]

{ #category : #initialization }
DCPlant >> initialize [
super initialize.
self category: self class unclassifiedTag.
self date: Date today.
self notVisible
]

{ #category : #testing }
DCPlant >> isUnclassified [
	^ self category = self class unclassifiedTag
]

{ #category : #testing }
DCPlant >> isVisible [ 
	^ self visible
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
DCPlant >> text [
^ text

]

{ #category : #accessing }
DCPlant >> text: aString [
text := aString

]

{ #category : #accessing }
DCPlant >> title [
^ title

]

{ #category : #accessing }
DCPlant >> title: aString [
title := aString
]

{ #category : #accessing }
DCPlant >> visible [
^ visible

]

{ #category : #accessing }
DCPlant >> visible: aBoolean [
visible := aBoolean

]
