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
			description: 'A lovely orange tree ready to bear fruit.' 
			category: 'Tree'.
			
	"Hooks that subclasses may override to define the fixture of test."

]

{ #category : #tests }
DCInvTest >> testAllCategories [
	inv writeBlogPost: plant.
	self assert: inv allCategories size equals: 1
]
