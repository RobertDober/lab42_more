# Lab42::More More for Core

This is an extionsion of the _lab42_core_ gem, which will not be maintained anymore. It therefore
remimplements the features of that gem.

_lab42_more_ is intended as a base gem depending on Ruby 2.1 or greater and not on any other gem.


## Philosophy

## Get rid of inconsistencies and kludges

Meaning basically `Symbol#to_proc` for the kludges part and the tough way to specify behavior when **not** using blocks.

The desire for a more concise expression of behavior - in the functional sense - was satisfied very early by means of the
`Symbol#to_proc` kludge and the way Ruby interprets the syntactic construct of `&<expression>` 



## Detailed Verified Documentation, Using QED

Please see the [QED](http://rubyworks.github.io/qed/) demos [here](https://github.com/RobertDober/lab42_more/blob/master/demo)
for a detailed description of all features.
