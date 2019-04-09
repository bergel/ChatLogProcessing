Class {
	#name : #CLPMessage,
	#superclass : #Object,
	#instVars : [
		'author',
		'content',
		'timestamp',
		'manualConversationId',
		'isManuallyAnnotedAsQuestion'
	],
	#category : #ChatLogProcessing
}

{ #category : #accessing }
CLPMessage >> author [
	^ author
]

{ #category : #accessing }
CLPMessage >> author: anObject [
	author := anObject
]

{ #category : #accessing }
CLPMessage >> content [
	^ content
]

{ #category : #accessing }
CLPMessage >> content: anObject [
	content := anObject
]

{ #category : #initialization }
CLPMessage >> initialize [
	super initialize.
	isManuallyAnnotedAsQuestion := false
]

{ #category : #testing }
CLPMessage >> isGreeting [
	content ifNil: [ ^ false ].
	^ self content substrings includesAnyOf: #('Hi' 'Hello' 'hi' 'hello')
]

{ #category : #accessing }
CLPMessage >> isManuallyAnnotedAsQuestion [
	^ isManuallyAnnotedAsQuestion
]

{ #category : #accessing }
CLPMessage >> isManuallyAnnotedAsQuestion: anObject [
	isManuallyAnnotedAsQuestion := anObject
]

{ #category : #testing }
CLPMessage >> isThanking [
	content ifNil: [ ^ false ].
	^ self content substrings includesAnyOf: #('Thanks' 'Thank')
]

{ #category : #accessing }
CLPMessage >> manualConversationId [
	^ manualConversationId
]

{ #category : #accessing }
CLPMessage >> manualConversationId: anObject [
	manualConversationId := anObject
]

{ #category : #accessing }
CLPMessage >> timestamp [
	^ timestamp
]

{ #category : #accessing }
CLPMessage >> timestamp: anObject [
	timestamp := anObject
]
