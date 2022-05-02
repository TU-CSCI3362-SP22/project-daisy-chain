Class {
	#name : #DCMasterListTest,
	#superclass : #TestCase,
	#instVars : [
		'dcMasterList'
	],
	#category : #'DaisyChain-Tests'
}

{ #category : #running }
DCMasterListTest >> setUp [
	dcMasterList := DCMasterList new.
	"Hooks that subclasses may override to define the fixture of test."

]

{ #category : #tests }
DCMasterListTest >> testAdd [
	| plant |
	plant := ((DCPlant name:'FakePlant' description:'[testAdd] Test Plant. You should not see this.' category: 'Meow') visible: true).
	dcMasterList add: plant.
	dcMasterList add: plant.
	self assert: (dcMasterList masterlist includes: plant) equals: true.
	"TODO make sure no duplicates"
	
]

{ #category : #tests }
DCMasterListTest >> testFillMasterList [
	self assert: dcMasterList masterlist size equals: 15.

]

{ #category : #tests }
DCMasterListTest >> testInitialize [
	self assert: dcMasterList=nil equals: false.
]
