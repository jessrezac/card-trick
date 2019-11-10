# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Stack has_many Cards, User has_many Stacks) 
- [x] Include at least one belongs_to relationship (Card belongs_to Stack; Stack belongs_to User)
- [x] Include at least two has_many through relationships (User has many Cards through Attempts; Cards has many Users through Attempts)
- [x] Include at least one many-to-many relationship (Card has_many Users through Attempts, User has_many Cards through Attempts)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attempt.success)
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (Card & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (users#new route)
- [x] Include login (sessions#new route)
- [x] Include logout (sessions#destroy route)
- [x] Include third party signup/login (Omniauth on users#new and sessions#new routes)
- [x] Include nested resource show or index (stacks/1/cards)
- [x] Include nested resource "new" form (stacks/1/cards/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
