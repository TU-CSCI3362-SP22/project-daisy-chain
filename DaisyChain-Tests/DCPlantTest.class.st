Class {
	#name : #DCPlantTest,
	#superclass : #TestCase,
	#instVars : [
		'plant',
		'blankPlant'
	],
	#category : #'DaisyChain-Tests'
}

{ #category : #running }
DCPlantTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	plant := DCPlant 
			name: 'Orange Tree' 
			description: 'A lovely orange tree ready to bear fruit.' 
			category: 'Tree'.
			
	blankPlant := DCPlant new.
]

{ #category : #tests }
DCPlantTest >> testBeVisible [
	plant visible: false.
	self assert: plant visible equals: false.
	plant beVisible.
	self assert: plant visible equals: true
]

{ #category : #tests }
DCPlantTest >> testInitialize [ 
	self assert: blankPlant isVisible equals: true.
	self assert: blankPlant category equals: blankPlant class unclassifiedTag.
	self assert: blankPlant nickname equals: ''.
	
]

{ #category : #tests }
DCPlantTest >> testIsUnclassified [
	self assert: plant isUnclassified equals: false.
]

{ #category : #tests }
DCPlantTest >> testIsVisible [
	plant visible: false.
	self assert: plant isVisible equals: false.
	plant beVisible.
	self assert: plant isVisible equals: true
]

{ #category : #tests }
DCPlantTest >> testNotVisible [
	plant visible: true.
	self assert: plant visible equals: true.
	plant notVisible.
	self assert: plant visible equals: false
]

{ #category : #tests }
DCPlantTest >> testPlantIsCreatedCorrectly [
self assert: plant name equals: 'Orange Tree'.
self assert: plant description equals: 'A lovely orange tree ready to bear fruit.'.
self assert: plant category equals: 'Tree'
"Based on plant created in setup"
]
