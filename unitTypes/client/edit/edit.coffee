Template.UnitTypesEdit.onCreated -> null

Template.UnitTypesEdit.helpers()

Template.UnitTypesEdit.events()

AutoForm.hooks(
  updateUnitType:
    onSuccess: (f, r) ->
      Router.go 'unitTypes.detail', {id:@docId}  
)