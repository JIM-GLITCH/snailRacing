/* 

Write a Prolog code to solve the problem below.  



Exercise 3. Snail Racing # 2



After the recent SCAD snail racing contest, the four contestants were congratulating each other.



1. Only one snail wore the same number as the position it finished in.

2. Alfred's snail wasn't painted yellow nor blue, and the snail who wore 3, which was painted red, beat the snail who came in third.

3. Arthur's snail beat Anne's snail, whereas Alice's snail beat the snail who wore 1.

4. The snail painted green, Alice's, came second and the snail painted blue wore number 4.

5). Anne's snail wore number 1.

Can you work out who's snail finished where, its number and the color it was painted?
 */

main:-
    Wores = [1,2,3,4],
    permutation([alfred,arthur,anne,alice], Persons),
    permutation([yellow,blue,red,green],Colors),
    permutation([1,2,3,4],Ranks),
    maplist(buildItem,Wores,Persons,Colors,Ranks,Items),
 
    onlyOneSnailWoreTheSameNumberAsRank(Items),
    alfredSnailNotYellowOrBlue(Items),
    snailWore3PaintedRedBeatThird(Items),
    arthurBeatAnneAndAliceBeatWhoWore1(Items),
    snailGreenAliceSecond(Items),
    snailBlueWore4(Items),
    anneSnailWore1(Items),
    writeln(Items).

onlyOneSnailWoreTheSameNumberAsRank(Items):-
    foldl(count, Items, 0, 1).
count(Wore-_-_-Rank,Acc,Res):-
        Wore = Rank
    ->  Res is Acc +1
    ;   Res = Acc.

buildItem(Wore,Person,Color,Rank, Wore-Person-Color-Rank).

alfredSnailNotYellowOrBlue(Items):-
    member(_-alfred-Color-_,Items),
    Color \=yellow,Color\=blue.

snailWore3PaintedRedBeatThird(Items):-
    member(3-_-red-Rank,Items),Rank<3.

arthurBeatAnneAndAliceBeatWhoWore1(Items):-
    member(_-arthur-_-Rank1,Items),member(_-anne-_-Rank2,Items),
    Rank1<Rank2,
    member(_-alice-_-Rank3,Items),member(1-_-_-Rank4,Items),
    Rank3<Rank4.

snailGreenAliceSecond(Items):-
    member(_-alice-green-2,Items).

snailBlueWore4(Items):-
    member(4-_-blue-_,Items).
anneSnailWore1(Items):-
    member(1-anne-_-_,Items).





    
