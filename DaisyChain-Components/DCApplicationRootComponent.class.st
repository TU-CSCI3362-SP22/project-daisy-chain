Class {
	#name : #DCApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'DaisyChain-Components'
}

{ #category : #testing }
DCApplicationRootComponent class >> canBeRoot [
	^ true
]

{ #category : #'class initialization' }
DCApplicationRootComponent class >> initialize [
"self initialize"
| app |
app := WAAdmin register: self asApplicationAt: 'DaisyChain'.
app
addLibrary: JQDeploymentLibrary;
addLibrary: JQUiDeploymentLibrary;
addLibrary: TBSDeploymentLibrary

]

{ #category : #rendering }
DCApplicationRootComponent >> children [ 
	^ { main }
]

{ #category : #initialization }
DCApplicationRootComponent >> initialize [
super initialize.
main := DCPlantsListComponent new

]

{ #category : #initialization }
DCApplicationRootComponent >> main: aComponent [
main := aComponent

]

{ #category : #rendering }
DCApplicationRootComponent >> renderContentOn: html [
html render: main
]

{ #category : #rendering }
DCApplicationRootComponent >> updateRoot: anHtmlRoot [
super updateRoot: anHtmlRoot.
anHtmlRoot beHtml5.
anHtmlRoot title: 'DaisyChain'

]
