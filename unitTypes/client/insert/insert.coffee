Template.UnitTypesInsert.onCreated -> null

Template.UnitTypesInsert.events()

AutoForm.hooks(
  insertUnitType:
    onSuccess: (f, r) ->
      Router.go 'unitTypes.index'  
)
