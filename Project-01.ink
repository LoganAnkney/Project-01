/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/
VAR sword = 0
VAR anger = 0
VAR pet_name = ""
VAR torch = 0

-> riding

== riding ==
You are riding into castletown on your trusty steed. What was it's name?
* [Honse] 
    ~ pet_name = "Honse"
    -> gate_house
* [Buttercup] 
    ~ pet_name = "Buttercup"
    -> gate_house
* [Sergent Max Niehstappen] 
    ~ pet_name = "Sergent Max Niehstappen"
    -> gate_house

== gate_house ==

As you approah the gates, you are stop by 2 armed guards and {pet_name} comes to a stop. what bring you here traveler to the kings wonderful town? 

*[Did the king not tell you I was coming?]  -> aguards
*[Just in for an adventure] -> guards

== aguards ==
{advance_anger()} -> guards
== guards ==
 {not anger == 0 : "Unamused by your joke, they begin to talk to eachother, snickering and mocking you." Sure kid, go ahead, but you better watch yourself. | I remember those days not to long, go right on through sir, and enjoy the many stalls we have available} -> town

== town ==
You begin to walk the town after tying up your {pet_name}, you see plenty of stalls as you pass by. Up on the hill standing infront of you is the "King's Castle". The architecture looks incredible, you've never seen a structure quite like this.
+ [Look at the shops with a variety of items on display] -> shop
* [Go towards the castle]-> castle_gate

== castle_gate == 
You arrive at the gates and walk into the throne room. Light gleaming down on you from the huge stained glass panels surround this magnificent room. The king looks down at you from his throne and asks. What brings you here, traveler?

*[I fancy a job your Highness. Please send me on a quest] -> decision

== decision ==
{ anger == 2: My guards say you've made quite the impression on my subjects. Specifically poor Mary. They describe you as {advance_anger()}, So how about instead of sending you on a quest, "He waves his hand and multiple guards shackle you" you can join some of our least liked criminals in the dungeon | You seem like a nice young adventurer, why not, head out west to a small village, they've had dragon trouble} 

* {anger == 2} [You don't have a say in the matter] -> dungeon 
* {anger == 1 } [Begin you quest by heading out west] -> west
* {anger == 0 } [Take some extra armour as the King sends you out into the country] -> west

== west ==
To Be Continued in the western village...

-> DONE 
== dungeon ==

You meet your new new cellmates, Stinky Pete, and Little Johnny.
You won't be getting out for a while.

To Be Continued...
-> DONE

== shop == 
Look at all of my wears and weaponry
{sword <= 0 : What to buy??| You now have a trusty sword and shield! }
{torch == 1 : You have {torch} torch | You have {torch} torches}
* [Buy Sword and Shield] -> ashop
+ [Buy a torch] -> torch_pickup
+ [Return to the town square] -> town
* [Steal the Sword and Shield] -> chase

== ashop ==
You now have {swords()}
*[Shop]-> shop
== chase ==
{advance_anger()} You just stole {swords()}. "Hey you can't take that!!" "The nice old woman at the stand chases as far as she can until her back gives out and you continue to the King's through room". At least you have a sweet sword and shield, right. -> castle_gate

== function advance_anger ==

    ~ anger = anger + 1
    
    {
        - anger > 2:
            ~ anger = 2
    }    
    
    {    
        - anger <= 0:
            ~ return "a wonderful person"
        
        - anger == 1:
            ~ return "neutral person"
        
        - anger >= 2:
            ~ return " the worst person they has ever met"
    
    }
    

    
=== torch_pickup ===
~ torch = torch + 1
-> shop


== function swords ==

    ~ sword = sword + 1
    
  {
        - sword > 2:
            ~ sword = 2
    }    
    
    {    
        - sword <= 0:
            ~ return " nothing."
        
        - sword == 1:
            ~ return " a trusty sword and shield"
        
        - sword >= 2:
            ~ return " a trusty sword and shield"
    
    }
    
~ return sword

