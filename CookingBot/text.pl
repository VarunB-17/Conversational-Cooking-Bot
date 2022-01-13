%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Scripted text and phrases for ** GENERIC ** intents (sorted on intent name)		%%%
%%% Text is only provided for those intents that the agent will generate (use). 	%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Intent: appreciation receipt
text(appreciationReceipt, "You're welcome.").

% Intent: context mismatch
text(contextMismatch, "Not sure what that means in this context.").

% Intent: negative welfare receipt
text(negativeWelfareReceipt, "I'm sorry to hear that.").

% Intent: sequence closer
text(sequenceCloser, "Thank you.").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Scripted text and phrases for ** DOMAIN SPECIFIC ** intents (sorted on intent name)	%%%
%%% Text is only provided for those intents that the agent will generate (use). 	%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Intent: detail request recipe quantity 
% This intent is used for slot filling for the user intent: requestRecipeQuantity
% requestRecipeQuantity has two entities: recipe and ingredient (check your Dialogflow agent)

% Intent: final step (of a recipe)
text(finalStep, Txt) :- currentRecipe(Recipe), finalStep(Recipe, _, Txt).

% Intent: grant recipe quantity
% This intent is used for answering the user intent: requestRecipeQuantity.
% Instruction:
%	Use the predicates currentRecipe/1, mostRecentIngredient/1, and ingredient/3 to construct a
%	string that provides the answer.

% Intent: ingredients check
% Instruction
%	For the current recipe, combine an ingredients check question with a (nicely formatted) list 
%	of all ingredients with the amount needed for that recipe. Add useful helper predicate
%	definitions to the cooking.pl file. Hint 1: You can add "<br />" for adding new lines (on 
%	the chat webpage). Hint 2: Use the atomics_to_string/3 built-in predicate for combining the 
%	ingredients.

% Intent: recipe choice receipt
% Instruction:
% 	Collects recipe name provided by user from session history using the given currentRecipe/1 
% 	predicate and checks that the recipe is available in the agent's recipe database using the
% 	given recipes/1 predicate.
	
% Intent: recipe confirm
text(recipeConfirm, Txt) :- currentRecipe(Recipe), 
	string_concat("I will now guide you through the process of making ", Recipe, Txt).
		
% Intent: recipe step
% This intent is used as part of a repeated subpattern and therefore uses the stepCounter/1
% predicate to fetch the right step.
text(recipeStep, Txt) :- currentRecipe(Recipe), stepCounter(Cnt), step(Recipe, Cnt, Txt).