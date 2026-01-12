% dish(Name, Price, IngredientGrams).
dish(pizza, 2200, [cheese-300, tomato-350]).
dish(ratatouille, 2200, [tomato-70, eggplant-150, garlic-50]).
dish(garlic_bread, 1600, [cheese-50, garlic-200]).
:- dynamic ingredient/2.
% ingredient(Name, CostPerGram).
ingredient(cheese, 4).
ingredient(tomato, 2).
ingredient(eggplant, 7).
ingredient(garlic, 6).

count_ingredients(Dish, NumIngredients):-
    dish(Dish,_, Ingredients),
    length(Ingredients, NumIngredients).

ingredient_amount_cost(Ingredient, Grams, TotalCost):-
    ingredient(Ingredient, Cost),
    TotalCost is Cost*Grams.

check_cost([],0).
check_cost([I-G|Ingredients], Cost):-
    ingredient_amount_cost(I,G,CostI),
    check_cost(Ingredients, Cost2),
    Cost is CostI + Cost2.

dish_profit(Dish,Profit):-
    dish(Dish,Price,Ingredients),
    check_cost(Ingredients, TotalCost),
    Profit is Price - TotalCost.

update_unit_cost(Ingredient,NewUnitCost):-
    retractall(ingredient(Ingredient,_)),
    assert(ingredient(Ingredient,NewUnitCost)).

most_expensive_dish(Dish,Price):-
    dish(Dish,Price,_),
    \+ (dish(_,Price2,_), Price2>Price).

consume_ingredient(IngredientStocks,Ingredient,Grams,NewIngredientStocks):-
    nth0(Index,IngredientStocks,Ingredient-Stock, Rest),
    NewStock is Stock-Grams,
    nth0(Index, NewIngredientStocks, Ingredient-NewStock, Rest).

check_ingredient_in_recipe(_,[]):-fail.
check_ingredient_in_recipe(Ingredient, [L-_|_]):-
    L == Ingredient.

check_ingredient_in_recipe(Ingredient, [L-_|List]):-
    L \== Ingredient,
    check_ingredient_in_recipe(Ingredient,List),!.

count_dishes_with_ingredient(Ingredient, N):-
    findall(
        Dish,
        (dish(Dish,_,Recipe), check_ingredient_in_recipe(Ingredient,Recipe)),
        AllDishes
        ),
        length(AllDishes,N).

list_dishes(DishIngredients):-
    bagof(
        Dish-IngredientList,
        G^P^Recipe^(dish(Dish,P,Recipe),
        findall(
            Ingredient,
            member(Ingredient-_,Recipe),
            IngredientList
            )
        ),
    DishIngredients).

most_lucrative_dishes(Dishes):-
    setof(Profit-Dish,
        A^B^(dish(Dish,A,B),
        dish_profit(Dish,Profit)),
        DishesUnsorted
        ),
    reverse(DishesUnsorted, Sorted),

    findall(Dish,
        member(_-Dish, Sorted),
        Dishes
        ).


