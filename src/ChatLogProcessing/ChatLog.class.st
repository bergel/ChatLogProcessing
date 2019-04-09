Class {
	#name : #ChatLog,
	#superclass : #Object,
	#instVars : [
		'messages'
	],
	#category : #ChatLogProcessing
}

{ #category : #'as yet unclassified' }
ChatLog >> importFrom: aBigString [

messages := Array streamContents: [ :out |
  aBigString readStreamDo: [ :input |
      (NeoCSVReader on: (ZnBufferedReadStream on: input))
         skipHeader;
         "addIntegerField; addIntegerField; addIntegerField;"
         addSymbolField; addSymbolField; addSymbolField;
         addSymbolField; addSymbolField; addSymbolField; addSymbolField; addSymbolField;
         addFieldConverter: [ :x | x ifNotNil: [ x asDateAndTime ] ];
			addSymbolField;
			addSymbolField;
			addSymbolField;
         do: [ :each |
				| m |
				m := CLPMessage new author: (each at: 10);
													content: (each at: 11);
													manualConversationId: (each at: 1);
													timestamp: (each at: 9);
													yourself .
				(each at: 7) ifNotNil: [ ((each at: 7) includes: $q) ifTrue: [ m  isManuallyAnnotedAsQuestion: true ] ].
           	out nextPut: m ] ] ].
]

{ #category : #initialization }
ChatLog >> initialize [
	super initialize.
	messages := OrderedCollection new
]

{ #category : #accessing }
ChatLog >> messages [
	^ messages 
]

{ #category : #'as yet unclassified' }
ChatLog >> numberOfMessages [
	^ messages size
]
