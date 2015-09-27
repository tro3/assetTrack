Template.CustomersInsert.onCreated -> null

Template.CustomersInsert.events()

AutoForm.hooks(
  insertCustomer:
    formToDoc: (doc) ->
      doc.units = []
      doc
    
    onSuccess: (f, r) ->
      Router.go 'customers.index'  
)
