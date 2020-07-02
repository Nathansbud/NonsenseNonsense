-- An attempt to learn the basics of Haskell, following along with http://learnyouahaskell.com/types-and-typeclasses (and the internet)

{-

Operators: 
'' is for characters, "" is for strings; ++ combines 2 lists
[] syntax for list; !! retrieves (e.g. [1, 2, 3] !! 0)
     - head [1, 2, 3] -> 1; tail [1, 2, 3] -> [2, 3]
     - last [1, 2, 3] -> 3; init [1, 2, 3] -> [1, 2]
null [] -> True; null "" -> True

take n [1, 2, 3] == (Pythonic) [1, 2, 3][:n]
drop n [1, 2, 3] == (Pythonic) [1, 2, 3][n:]
maximum; minimum; sum; product

elem n [1, 2, 3] for list contains; infix notation (n `elem` [1, 2, 3]) also possible

.. defines a range in Haskell; [1..10] -> [1, 2, 3, ..., 10]
    - An arithmetic sequence can be defined by doing [LB, N..UB], where (N - LB) = step, and UB is upper bound
    - Ranges need no upper bound; [1..] counts up forever, but the list is not initialized immediately as Haskell is LAZY

cycle repeats a list; cycle [1, 2, 3] creates an infinite list of [1, 2, 3] ([1, 2, 3, 1, 2, 3, 1, 2, 3, ...])
repeat n repeats something n times; repeat 5 -> [5, 5, 5, 5, 5, ...],
replicate n m returns a list of n ms; repeat 5 10 -> [10, 10, 10, 10, 10]

LIST COMPREHENSION IS JUST PYTHON GENERATORS

[x*2 | x <- [1..10], x*2 >=12]
    - You can have multiple predicate conditions;
    - You can use nested comprehensions:
        let xxs = [[1, 2, 3], [1, 2, 3], [1, 2, 3]]
        [[x | x <- xs, odd x] | xs <- xxs] -> [[1, 3], [1, 3], [1, 3]]

Python-y generator syntax works too; busted FizzBuzz:
    [if x `mod` 15 == 0 then "FIZZBUZZ" else if x `mod` 5 == 0 then "FIZZ" else if x `mod` 3 == 0 then "BUZZ" else "" | x <- [1..100]]

Tuples are...as tuples do
    - LISTS in Haskell are single typed; tuples can be multiple types
    - ["a", 1, 2] crashes; ("a", 1, 2) does not
    - fst and snd can be used to get the...first and second element of a tuple, but only work on duples
    - zip creates a list of tuples from 2 lists 
        - zip [1, 2, 3, 4] [3, 4] -> [(1, 3), (2, 4)]
-}

double x = 2*x
mult a b = a * b

life_state age = if age >= 21 then print("drinkable adult")
                 else if age >= 18 then print("adult")
                 else print("child")
                
name = "ack"
names = ["Zack", "Rana", "Prithvi", "Kothari"]

factorial n = if n == 1 then 1 else n*factorial(n - 1) 
sqrall = map (^2)
area t args = case t of 
    "circle" -> pi * (args!!0)^2
    "square" -> (args!!0)^2
    "triangle" -> 0.5*(product args)

dot a b = sum [fst x * snd x | x <- (zip a b)]
mag v = sqrt(sum(map (^2) v))
v_angle a b = acos((dot a b)/((mag a) * (mag b)))


perimeter_bound m p = [(a, b, c) | a <- [1..m], b <- [1..a], c <- [1..b], a^2 + b^2 == c^2, (a+b+c)<p]


{-
Haskell is statically typed but infers; explicit type declaration can be done as function signatures

:t variable -> Type of Variable; :t True -> Bool

Types:
    - Int (og int), Integer (unbounded int)
    - Float, Double
    - Bool
    - Char, String (syntactic for [Char])
Typeclasses:
    - Interface; if a type is a part of a typeclass, it supports and implements its behavior
    - Eq typeclass is for equality  
        - (==) :: (Eq a) => a -> a -> Bool
        - If Eq class constraint is used, == or /= are in the function
    - => is class constraint; type of those two values must be a member of the Eq class (this was the class constraint).
        - a must be contained by a; this
    - Ord is for ordering
        - (>) :: (Ord a) => a -> a -> Bool  
        - (<) :: (Ord a) => a -> a -> Bool
        ...
    - `compare` infix is the spaceship operator (<=>), returns GT (greater), LT (less), EQ (equal)
    - Ord members must be Eq members

show xs converts a type to a string; 
    - show [1, 2, 3] -> "[1, 2, 3]"

read st to -- converts string st -> to, with to used for inference:
    - read "123" + 5 -> 128
    - read "[1, 2, 3]" ++ [4, 5, 6] -> [1, 2, 3, 4, 5, 6]
    - Type annotations can be used to cast read return values to the desired type!!!! BRUH
        - read "[1, 2, 3]" :: [Int]
        - read "10" :: Double

pred and succ can be used for ordered things
    - succ 1 -> 2
    - pred 1 -> 0

fromIntegral can be used to cast from Integer -> Num type

-}

to_celsius :: Float -> Float
to_celsius f = (f - 32)*5/9

to_fahrenheit :: Float -> Float
to_fahrenheit c = (c*9/5)+32

fact :: Int -> Int
fact n = product [1..n]

semi a b c = 0.5 *(a+b+c)
heron a b c = if (semi a b c) > (maximum [a, b, c]) then sqrt (product [(semi a b c)-n | n <- [0, a, b, c]]) else 0

lts xs = "A"++(show xs)

toUpper :: Char -> Char
toUpper c = if c >= 'a' && c <= 'z' then (toEnum ((fromEnum c) - 32)) else c
--[toUpper n | n <- ['a'..'z']] -> "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

{-
	Functions can be defined as having base cases by default; PATTERN MATCHING
		- If no default case is provided, an exception will be thrown for an unmatched pattern
-}
true_factorial :: (Integral a) => a -> a
true_factorial 0 = 1
true_factorial n = n*true_factorial(n - 1)

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci(n-1)+fibonacci(n-2)

greet :: String -> String
greet "Hi" = "Hello!"
greet "Sup" = "Not much, 'sup with you?"
greet g = "Not heard that one before..."

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (nx, ny) (mx, my) = (nx + mx, ny + my)

tell :: (Show a) => [a] -> String
tell [] = "No list here bois"
tell (x:[]) = "1-elem list here bois"
tell (x:y:[]) = "2-len"
tell (x:y:l) = "listy bois"

bar_entry :: (Float n) => n -> String
bar_entry age
	| age < 18 = "You're a kid! Don't make me call your parents..."
	| age < 21 = "You may be an adult, but alcohol ain't it chief"
	| age >= 21 = "Welcome aboard!"







