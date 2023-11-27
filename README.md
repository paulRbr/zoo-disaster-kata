# Ruby note

## Write code in `solution.rb`

Don't change the `who_eats_who(zoo)` method signature if you want the tests to pass

## Try the first simple test

Run `ruby test_simple.rb` to test your code

## Proof-test your code with advanced tests

Run `ruby test_advanced.rb` to launch the full test suite and see if your solution holds!

# Story

A freak power outage at the zoo has caused all of the electric cage doors to malfunction and swing open...

All the animals are out and some of them are eating each other!

# <span style='color:red'>It's a Zoo Disaster!</span>

Here is a list of zoo animals, and what they can eat

* antelope eats grass
* big-fish eats little-fish
* bug eats leaves
* bear eats big-fish
* bear eats bug
* bear eats chicken
* bear eats cow
* bear eats leaves
* bear eats sheep
* chicken eats bug
* cow eats grass
* fox eats chicken
* fox eats sheep
* giraffe eats leaves
* lion eats antelope
* lion eats cow
* panda eats leaves
* sheep eats grass

# Kata Task

### INPUT
A comma-separated string representing all the things at the zoo

### TASK
Figure out who eats whom until no more eating is possible.

### OUTPUT 

A list of strings (refer to the example below) where:
* The first element is the initial zoo (same as INPUT)
* The last element is a comma-separated string of what the zoo looks like when all the eating has finished
* All other elements (2nd to last-1) are of the form ```X eats Y``` describing what happened


# Notes

* Animals can only eat things beside them

* Animals always eat to their **LEFT** before eating to their **RIGHT**

* Always the **LEFTMOST** animal capable of eating will eat before any others

* Any other things you may find at the zoo (which are not listed above) do not eat anything and are not edible


# Example

*Input*

```"fox,bug,chicken,grass,sheep"```

*Working*
<table>
<tr><td>1<td>fox can't eat bug<td><pre>"fox,bug,chicken,grass,sheep"</pre></tr>
<tr><td>2<td>bug can't eat anything<td><pre>"fox,bug,chicken,grass,sheep"</pre></tr>
<tr><td>3<td><span style='color:red'>chicken eats bug</span><td><pre>"fox,chicken,grass,sheep"</pre></tr>
<tr><td>4<td><span style='color:red'>fox eats chicken</span><td><pre>"fox,grass,sheep"</pre></tr>
<tr><td>5<td>fox can't eat grass<td><pre>"fox,grass,sheep"</pre></tr>
<tr><td>6<td>grass can't eat anything<td><pre>"fox,grass,sheep"</pre></tr>
<tr><td>7<td><span style='color:red'>sheep eats grass</span><td><pre>"fox,sheep"</pre></tr>
<tr><td>8<td><span style='color:red'>fox eats sheep</span><td><pre>"fox"</pre></tr>
</table>

*Output*

```["fox,bug,chicken,grass,sheep", "chicken eats bug", "fox eats chicken", "sheep eats grass", "fox eats sheep", "fox"]```

