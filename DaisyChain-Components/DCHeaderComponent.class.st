Class {
	#name : #DCHeaderComponent,
	#superclass : #WAComponent,
	#category : #'DaisyChain-Components'
}

{ #category : #rendering }
DCHeaderComponent >> renderBrandOn: html [
html tbsNavbarHeader: [
html tbsNavbarBrand
url: self application url;
with: 'Daisy Chain'. ]

]

{ #category : #rendering }
DCHeaderComponent >> renderContentOn: html [
html tbsNavbar beDefault; with: [
html tbsContainer: [
self renderBrandOn: html.
]]
]
