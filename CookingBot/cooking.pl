%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Domain specific cooking assistant knowledge						%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/**
 * currentRecipe(-RecipeDown)
 *
 * Retrieves the current recipe from memory (this assumes that the last time a recipe is mentioned 
 * also is the user's current choice.
 *
 * @param RecipeDown Recipe name in lower case.
**/
currentRecipe(RecipeDown) :- keyValue(recipe, Recipe), downcase_atom(Recipe, RecipeDown).

/**
 * mostRecentIngredient(-Ingredient)
 *
 * Retrieves the latest (mentioned or relevant = updated) ingredient from memory.
 *
 * @param Ingredient The ingredient currently stored in the agent's memory.
**/
mostRecentIngredient(Ingredient) :- keyValue(ingredient, Ingredient).

/**
 * recipes(-Recipes)
 *
 * Collects all (shorthand) recipe names from the recipe database using the recipeName/1 and 
 * shorthandName/2 predicates (both need to be present for a recipe to be retrieved!).
 *
 * @param Recipes A list of (shorthand) recipe names available in this file.
**/
recipes(Recipes) :-
	setof(RecipeName, Name^(recipeName(Name),
		shorthandName(Name, RecipeName)), Recipes).

/**
 * steps(a40recipeStep, -Cnt)
 *
 * Computes the number of steps in the current recipe. Assumes that the recipe is a linear structure
 * with steps that are consecutively numbered (i.e., 1, 2, ...).
 *
 * @param Cnt The number of steps in the current recipe (based on the step/3 predicate, excluding
 *		the finalStep/3).
**/
steps(a30recipeStep, Cnt) :-
	currentRecipe(Recipe), bagof(Nr, Txt^step(Recipe, Nr, Txt), Nrs), max_list(Nrs, Cnt).