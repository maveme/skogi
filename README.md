# S/Kogi

todo desc

### Installation

* Get a squeak-trunk build (should work with version 5.4 or 6, after its release)
* Open a workspace by left-clicking into the world, select "Workspace"
* Paste and select the following. Then press ctrl+d/cmd+d for "do-it"
```smalltalk
Metacello new
  baseline: 'SKogi';
  repository: 'github://maveme/skogi:master/packages';
  load.
```
* Now, to try out S/Kogi, run any of the following lines using the same "do-it" method:
```smalltalk
SBGrammarTransformer grammarStatemachine simplifyAndOpen.
SBGrammarTransformer grammarSonificationBlocks simplifyAndOpen.
SBGrammarTransformer grammarQL simplifyAndOpen.
SBGrammarTransformer grammarRascalJava18 simplifyAndOpen.
SBGrammarTransformer grammarMath simplifyAndOpen.
SBGrammarTransformer grammarRascalJavascript simplifyAndOpen.
SBGrammarTransformer grammarMiniJava simplifyAndOpen.
SBGrammarTransformer grammarCloudLang simplifyAndOpen.
```
