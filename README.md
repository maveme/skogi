# S/Kogi
[![DOI](https://zenodo.org/badge/406386165.svg)](https://zenodo.org/badge/latestdoi/406386165)

S/Kogi generates [Blockly](https://developers.google.com/blockly/) editors based on [Rascal](https://www.rascal-mpl.org)/Ohm-like grammars.
It improves upon its predecessor [Kogi](https://github.com/cwi-swat/kogi) by transforming the input grammar to yield a block-based editor that more closely resembles the hand-crafted ones found in e.g. Scratch or MakeCode.

### Installation

* Get a [squeak-trunk build](http://files.squeak.org/trunk/) (should work with version 5.4 or 6, after its release)
* Open a workspace by left-clicking into the world, select "Workspace"
* Paste and select the following. Then press ctrl+d/cmd+d for "do-it" (note that there will be a dialog asking to install "Tonel" after a while underneath the progress bar, which you should confirm)
```smalltalk
Metacello new
  baseline: 'SKogi';
  repository: 'github://maveme/skogi:master/packages';
  load.
```
* Now, to try out S/Kogi, run any of the following lines using the same "do-it" method (paste, select line, press ctrl+d/cmd+d):
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

### Custom Grammars

To try out a new grammar, ensure that the grammar is parseable as an [Ohm grammar](https://github.com/harc/ohm/blob/master/doc/syntax-reference.md), then create a new method on the class side of SBGrammarTransformer (to do so, open the Browser by left-clicking in the world, then select the SKogi-Core package in the left panel, select the SBGrammarTransformer class, click on "class" below the class name, and finally find e.g. the `grammarStatemachine` method, give it a new name in the editor window, paste your grammar, and hit save).

Now, you can open your new grammar in the same way as above:
```smalltalk
SBGrammarTransformer grammarNameThatYouGave simplifyAndOpen.
```
